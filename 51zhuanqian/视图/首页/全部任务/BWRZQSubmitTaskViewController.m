#import "BWRZQSubmitTaskViewController.h"
#import "GlobalFunction.h"
#import "BWRZQPersonViewController.h"
#import "BWRZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "BWRZQSubmitAlertView.h"
#import "BWRZQSubmitSuccessInfoView.h"
#import "MBProgressHUD.h"
@interface BWRZQSubmitTaskViewController ()<UploadImageViewDelegate, UIScrollViewDelegate, MIPhotoBrowserDelegate>{
    NSMutableArray *uploadMutArr;
    NSMutableArray *uploadImageMutArr;
    BOOL        editBool;
    NSMutableArray *oneViewImageMutArr;
}
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@end
@implementation BWRZQSubmitTaskViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交任务结果";
    [self addBackBtn];
    oneViewImageMutArr = [NSMutableArray array];
    uploadImageMutArr = [NSMutableArray array];
    editBool = YES;
    self.commentTextView.textColor = PlaceholderColor;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    [self.sureBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - 44 - IS_iPhoneX_Bottom - 64)];
    self.scrollView.alwaysBounceVertical = YES;
    if (self.taskId.length > 0) {
        self.scrollView.hidden = YES;
        self.sureBtn.hidden = YES;
        [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/%@", self.taskId] parameters:nil success:^(id responseObject) {
            [self hideHudAlert];
            NSDictionary *contentDic = responseObject;
            self.task = [BWRZQTaskObject taskDetailDic:contentDic];
            self.task.orderId = self.orderId;
            [self showContent];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }else{
        [self showContent];
    }
}
- (void)showContent{
    self.scrollView.hidden = NO;
    self.sureBtn.hidden = NO;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
    title.text = @"需提交内容";
    title.font = [UIFont boldSystemFontOfSize:18.0f];
    title.textColor = TextColor;
    [self.oneView addSubview:title];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.task.taskRequirement];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.task.taskRequirement length])];
    CGSize labelSize = [self.task.taskRequirement boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(15, title.frame.origin.y + title.frame.size.height + 10, labelSize.width, labelSize.height)];
    content.numberOfLines = 0;
    content.text = self.task.taskRequirement;
    content.textColor = TextColor;
    content.font = [UIFont systemFontOfSize:14.0f];
    content.attributedText = attributedString;
    [self.oneView addSubview:content];
    float originImageY = content.frame.origin.y + content.frame.size.height + 10;
    float originImageX = 15;
    float imageWidth = 90;
    for (int j = 0; j < self.task.taskRequirementImages.count; j++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originImageX, originImageY, imageWidth, imageWidth)];
        imageView.clipsToBounds = YES;
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        imageView.userInteractionEnabled = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[self.task.taskRequirementImages objectAtIndex:j]] placeholderImage:PlaceholderImage];
        [self.oneView addSubview:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(requirementTapAction:)];
        [imageView addGestureRecognizer:tap];
        originImageX = originImageX + imageWidth + 15;
        if (SCREEN_WIDTH_DEVICE - originImageX < imageWidth + 30) {
            originImageX = 15;
            originImageY = originImageY + imageWidth + 15;
        }
        [oneViewImageMutArr addObject: imageView];
    }
    if (oneViewImageMutArr.count > 0) {
        originImageY = originImageY + imageWidth + 15;
    }else{
        originImageY = originImageY + 10;
    }
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, originImageY, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView setBackgroundColor:LineBackgroundColor];
    [self.oneView addSubview:lineImageView];
    [self.oneView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, lineImageView.frame.origin.y + lineImageView.frame.size.height)];
    [self.twoView setFrame:CGRectMake(0, self.oneView.frame.origin.y + self.oneView.frame.size.height, SCREEN_WIDTH_DEVICE, 340)];
    [self.scrollView setContentSize:CGSizeMake(0, self.twoView.frame.origin.y + self.twoView.frame.size.height)];
    uploadMutArr = [NSMutableArray array];
    BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15, 44, 90, 90)];
    upload.delegate = self;
    [self.twoView addSubview:upload];
    [uploadMutArr addObject:upload];
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task-order/%@/%@/submit", user.userID, self.task.taskId]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
    if (self.taskId.length > 0) {
        [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/%@", self.taskId]];
    }
}
#pragma mark ----RefundUploadImageViewDelegate
- (void)addUploadImageView:(BWRZQUploadImageView *)item{
    if (uploadMutArr.count > 0 && uploadMutArr.count <= 3) {
        if (uploadMutArr.count < 3) {
            BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * uploadMutArr.count, 44, 90, 90)];
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
            BWRZQUploadImageView *upload = [[BWRZQUploadImageView alloc] initItem:CGRectMake(15 + (90 + 10) * uploadMutArr.count, 44, 90, 90)];
            upload.delegate = self;
            [self.twoView addSubview:upload];
            [uploadMutArr addObject:upload];
        }
        for (int i = 0; i < uploadMutArr.count; i++) {
            BWRZQUploadImageView *object = [uploadMutArr objectAtIndex:i];
            [object setFrame:CGRectMake(15 + (90 + 10) * i, 44, 90, 90)];
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
        textView.text = @"请输入雇主要求的信息或任务结果的描述";
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
- (IBAction)surePress {
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    if (uploadImageMutArr.count > 0) {
        [dic setObject:uploadImageMutArr forKey:@"images"];
    }
    if (self.commentTextView.text.length > 0) {
        if (![self.commentTextView.text isEqualToString:@"请输入雇主要求的信息或任务结果的描述"]) {
            [dic setObject:self.commentTextView.text forKey:@"comment"];
        }
    }
    [self loadingHUDAlert:@"正在提交"];
    [[ServiceRequest sharedService] POSTJSON:[NSString stringWithFormat:@"task-order/%@/%@/submit", user.userID, self.task.orderId] parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if ([DEFAULTS boolForKey:@"NEVERSHOWSUBMITALERT"]) {
            BWRZQSubmitSuccessInfoView *alertView = [[BWRZQSubmitSuccessInfoView alloc] initItem];
            alertView.BackHandle = ^{
                if (self.RefreshHandle) {
                    self.RefreshHandle();
                }
                [self goBackAction];
            };
            [self.view.window addSubview:alertView];
        }else{
            BWRZQSubmitAlertView *alertView = [[BWRZQSubmitAlertView alloc] initItem];
            alertView.SureHandle = ^{
                NSLog(@"确认提交");
                BWRZQSubmitSuccessInfoView *alertView = [[BWRZQSubmitSuccessInfoView alloc] initItem];
                alertView.BackHandle = ^{
                    if (self.RefreshHandle) {
                        self.RefreshHandle();
                    }
                    [self goBackAction];
                };
                [self.view.window addSubview:alertView];
            };
            [self.view.window addSubview:alertView];
        }
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.commentTextView endEditing:YES];
}
- (void)requirementTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = self.oneView;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = oneViewImageMutArr.count;
    photoBrowser.currentImageIndex = [oneViewImageMutArr indexOfObject:imageView];
    photoBrowser.tagMut = 2;
    [photoBrowser show];
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    UIImageView *imageView = oneViewImageMutArr[index];
    return imageView.image;
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
