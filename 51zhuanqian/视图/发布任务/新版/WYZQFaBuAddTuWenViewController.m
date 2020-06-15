#import "WYZQFaBuAddTuWenViewController.h"
#import "GlobalFunction.h"
#import "WYZQUploadImageView.h"
#import "MBProgressHUD.h"
@interface WYZQFaBuAddTuWenViewController ()<UploadImageViewDelegate>{
    NSMutableArray *uploadMutArr;
    NSMutableArray *uploadImageMutArr;
    BOOL        editBool;
}
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (strong, nonatomic) NSString *placeholderStr;
@end
@implementation WYZQFaBuAddTuWenViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加图文说明";
    [self addBackBtn];
    [((UIButton *)[self addRigthBtn:@"保存"]) addTarget:self action:@selector(surePress) forControlEvents:UIControlEventTouchUpInside];
    uploadMutArr = [NSMutableArray array];
    uploadImageMutArr = [NSMutableArray array];
    [self.sureBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 44 - IS_iPhoneX_Bottom)];
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setContentSize:CGSizeMake(0, 400)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.placeholderStr = @"请详细说明本步骤操作事项与注意事项";
    if (self.object) {
        self.contentTextView.text = self.object.contentStr;
        self.contentTextView.textColor = TextColor;
        editBool = NO;
        NSArray *taskImages = self.object.images;
        for (int i = 0; i < taskImages.count; i++) {
            NSString *imageUrl = [taskImages objectAtIndex:i];
            WYZQUploadImageView *upload = [[WYZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * i, 277, 90, 90)];
            upload.delegate = self;
            upload.infoLabel.text = @"说明图片";
            [upload showContentImageView:imageUrl];
            [self.scrollView addSubview:upload];
            [uploadMutArr addObject:upload];
            [self->uploadImageMutArr addObject:imageUrl];
        }
        if (taskImages.count < 3) {
            WYZQUploadImageView *uploadEx = [[WYZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * taskImages.count, 277, 90, 90)];
            uploadEx.delegate = self;
            uploadEx.infoLabel.text = @"说明图片";
            [self.scrollView addSubview:uploadEx];
            [uploadMutArr addObject:uploadEx];
        }
    }else{
        self.contentTextView.textColor = PlaceholderColor;
        editBool = YES;
        WYZQUploadImageView *upload = [[WYZQUploadImageView alloc] initItem:CGRectMake(15, 277, 90, 90)];
        upload.delegate = self;
        [self.scrollView addSubview:upload];
        [uploadMutArr addObject:upload];
    }
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
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
        textView.text = self.placeholderStr;
        [textView setTextColor:PlaceholderColor];
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}
- (void)textViewDidChange:(UITextView *)textView{
    [textView setTextColor:TextColor];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.contentTextView endEditing:YES];
}
#pragma mark ----RefundUploadImageViewDelegate
- (void)addUploadImageView:(WYZQUploadImageView *)item{
    if (uploadMutArr.count > 0 && uploadMutArr.count <= 3) {
        if (uploadMutArr.count < 3) {
            WYZQUploadImageView *upload = [[WYZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * uploadMutArr.count, 277, 90, 90)];
            upload.delegate = self;
            [self.scrollView addSubview:upload];
            [uploadMutArr addObject:upload];
        }
        [self pushImage:item];
    }
}
- (void)removeUploadImageView:(WYZQUploadImageView *)item{
    if (uploadMutArr.count > 0) {
        [uploadImageMutArr removeObject:item.imageUrl];
        [uploadMutArr removeObject:item];
        [item removeFromSuperview];
        if (uploadMutArr.count == 2 && ((WYZQUploadImageView *)[uploadMutArr lastObject]).hasChoose) {
            WYZQUploadImageView *upload = [[WYZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * uploadMutArr.count, 277, 90, 90)];
            upload.delegate = self;
            [self.scrollView addSubview:upload];
            [uploadMutArr addObject:upload];
        }
        for (int i = 0; i < uploadMutArr.count; i++) {
            WYZQUploadImageView *object = [uploadMutArr objectAtIndex:i];
            [object setFrame:CGRectMake(15 + (90 + 10) * i, 277, 90, 90)];
        }
    }
}
- (void)pushImage:(WYZQUploadImageView *)item{
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
- (IBAction)surePress {
    if ([self.contentTextView.text isEqualToString:self.placeholderStr] || self.contentTextView.text.length == 0) {
        [self showHUDAlert:@"请输入说明内容"];
        return;
    }
    if (self.object) {
        self.object.contentStr = self.contentTextView.text;
        self.object.images = uploadImageMutArr;
        if (self.RefreshHandle) {
            self.RefreshHandle(self.object);
        }
    }else{
        WYZQFaBuBuZhouObject *object = [[WYZQFaBuBuZhouObject alloc] init];
        object.type = 1;
        object.contentStr = self.contentTextView.text;
        object.images = uploadImageMutArr;
        if (self.RefreshHandle) {
            self.RefreshHandle(object);
        }
    }
    [self goBackAction];
}
@end
