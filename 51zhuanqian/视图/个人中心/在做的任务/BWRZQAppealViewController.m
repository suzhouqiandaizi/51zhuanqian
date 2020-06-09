#import "BWRZQAppealViewController.h"
#import "GlobalFunction.h"
#import "BWRZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "MBProgressHUD.h"
@interface BWRZQAppealViewController ()<UploadImageViewDelegate, MIPhotoBrowserDelegate>{
    NSMutableArray *uploadMutArr;
    NSMutableArray *uploadImageMutArr;
    BOOL        editBool;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@end
@implementation BWRZQAppealViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"申诉";
    [self addBackBtn];
    uploadImageMutArr = [NSMutableArray array];
    editBool = YES;
    self.commentTextView.textColor = PlaceholderColor;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - IS_iPhoneX_Bottom)];
    self.scrollView.alwaysBounceVertical = YES;
    uploadMutArr = [NSMutableArray array];
    BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, 194, 90, 90)];
    upload.delegate = self;
    [self.twoView addSubview:upload];
    [uploadMutArr addObject:upload];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
}
- (IBAction)surePress {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (self.commentTextView.text.length > 0) {
        if (![self.commentTextView.text isEqualToString:@"请详细输入申诉原因"]) {
            [dic setObject:self.commentTextView.text forKey:@"comment"];
        }else{
            [self showHUDAlert:@"请详细输入申诉原因"];
            return;
        }
    }else{
        [self showHUDAlert:@"请详细输入申诉原因"];
        return;
    }
    if (uploadImageMutArr.count > 0) {
        [dic setObject:uploadImageMutArr forKey:@"images"];
    }
    [self loadingHUDAlert:@"正在提交"];
    [[ServiceRequest sharedService] POSTJSON:[NSString stringWithFormat:@"task-order/%@/apply-verify", self.orderId] parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        [self showHUDAlert:@"申诉成功"];
        [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
#pragma mark ----RefundUploadImageViewDelegate
- (void)addUploadImageView:(BWRZQUploadImageView *)item{
    if (uploadMutArr.count > 0 && uploadMutArr.count <= 3) {
        if (uploadMutArr.count < 3) {
            BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * uploadMutArr.count, 194, 90, 90)];
            upload.delegate = self;
            [self.twoView addSubview:upload];
            [uploadMutArr addObject:upload];
        }
        [self pushImage:item];
    }
}
- (void)removeUploadImageView:(BWRZQUploadImageView *)item{
    if (uploadMutArr.count > 0) {
        [uploadImageMutArr removeObject:item.imageUrl];
        [uploadMutArr removeObject:item];
        [item removeFromSuperview];
        if (uploadMutArr.count == 2 && ((BWRZQUploadImageView *)[uploadMutArr lastObject]).hasChoose) {
            BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * uploadMutArr.count, 194, 90, 90)];
            upload.delegate = self;
            [self.twoView addSubview:upload];
            [uploadMutArr addObject:upload];
        }
        for (int i = 0; i < uploadMutArr.count; i++) {
            BWRZQUploadImageView *object = [uploadMutArr objectAtIndex:i];
            [object setFrame:CGRectMake(15 + (90 + 10) * i, 194, 90, 90)];
        }
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (editBool) {
        editBool = NO;
        textView.text = @"";
        [textView setTextColor:TextColor];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        editBool = YES;
        textView.text = @"请详细输入申诉原因";
        [textView setTextColor:PlaceholderColor];
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSInteger textViewLength = [textView.text stringByReplacingCharactersInRange:range withString:text].length;
    if (textViewLength > 300) {
        [self showHUDAlert:@"限制输入300字"];
        return NO;
    }else if (textViewLength == 0){
        return YES;
    }else if (textViewLength > 0){
        return YES;
    }else{
        return YES;
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    [textView setTextColor:TextColor];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.commentTextView endEditing:YES];
}
- (void)pushImage:(BWRZQUploadImageView *)item{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"正在上传";
    __block BOOL hasAdd = NO;
    [[ServiceRequest sharedService] POSTJSON:@"image/base64" parameters:@{@"base64String":reSizeImageData(item.contentImageView.image, 0, 0)} success:^(id responseObject) {
        [hud hideAnimated:YES];
        NSString *imageUrl = [responseObject objectForKey:@"uploadFileUrl"];
        item.imageUrl = imageUrl;
        if (!hasAdd) {
            hasAdd = YES;
            [self->uploadImageMutArr addObject:imageUrl];
        }
    } failure:^(NSString *error, NSInteger code) {
        [hud hideAnimated:YES];
        [self showHUDAlert:error];
    } update:^(float progress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress = progress;
        });
    }];
}
@end
