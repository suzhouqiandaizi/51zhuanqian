#import "WYZQTaskDoingShowSubmitTaskViewController.h"
#import "GlobalFunction.h"
#import "WYZQPersonViewController.h"
#import "WYZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "WYZQSubmitAlertView.h"
#import "WYZQSubmitSuccessInfoView.h"
#import "MBProgressHUD.h"
@interface WYZQTaskDoingShowSubmitTaskViewController ()<UploadImageViewDelegate, UIScrollViewDelegate, MIPhotoBrowserDelegate>{
    NSMutableArray *uploadImageMutArr;
    NSMutableArray *oneViewImageMutArr;
}
@property (strong, nonatomic) WYZQTaskObject *task;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UILabel *neverInfoLabel;
@end
@implementation WYZQTaskDoingShowSubmitTaskViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交的任务结果";
    [self addBackBtn];
    oneViewImageMutArr = [NSMutableArray array];
    uploadImageMutArr = [NSMutableArray array];
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - IS_iPhoneX_Bottom - 64)];
    self.scrollView.alwaysBounceVertical = YES;
    self.scrollView.hidden = YES;
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/%@", self.taskId] parameters:nil success:^(id responseObject) {
        NSDictionary *contentDic = responseObject;
        self.task = [WYZQTaskObject taskDetailDic:contentDic];
        self.task.orderId = self.orderId;
        [self showContent];
        [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"/task-order/%@/submit-info", self.orderId] parameters:nil success:^(id submitObject) {
            self.scrollView.hidden = NO;
            [self hideHudAlert];
            NSString *comment = [submitObject objectForKey:@"comment"];
            if (comment.length > 0) {
                self.commentTextView.text = comment;
            }else{
                self.commentTextView.text = @"未填写任何内容";
                self.commentTextView.textColor = TextGrayColor;
            }
            NSArray *submitImageS = [submitObject objectForKey:@"images"];
            for (int j = 0; j < submitImageS.count; j++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + (90 + 10) * j, 44, 90, 90)];
                imageView.clipsToBounds = YES;
                [imageView setContentMode:UIViewContentModeScaleAspectFill];
                imageView.userInteractionEnabled = YES;
                [imageView sd_setImageWithURL:[NSURL URLWithString:[submitImageS objectAtIndex:j]] placeholderImage:PlaceholderImage];
                [self.twoView addSubview:imageView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(submitTapAction:)];
                [imageView addGestureRecognizer:tap];
                [self->uploadImageMutArr addObject: imageView];
            }
            if (submitImageS.count == 0) {
                self.neverInfoLabel.hidden = NO;
            }
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)showContent{
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
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task-order/%@/%@/submit", user.userID, self.task.taskId]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"image/base64"];
    if (self.taskId.length > 0) {
        [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/%@", self.taskId]];
    }
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
- (void)submitTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = self.twoView;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = uploadImageMutArr.count;
    photoBrowser.currentImageIndex = [uploadImageMutArr indexOfObject:imageView];
    photoBrowser.tagMut = 1;
    [photoBrowser show];
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    if (photoBrowser.tagMut == 2) {
        UIImageView *imageView = oneViewImageMutArr[index];
        return imageView.image;
    }else{
        UIImageView *imageView = uploadImageMutArr[index];
        return imageView.image;
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
@end
