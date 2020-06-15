#import "WYZQTaskDoingDetailContentViewController.h"
#import "MIPhotoBrowser.h"
#import "GlobalFunction.h"
#import "WYZQFriendDetailViewController.h"
#import "WZYLabel.h"
@interface WYZQTaskDoingDetailContentViewController ()<MIPhotoBrowserDelegate>{
    NSMutableArray *twoViewImageMutArr;
    NSMutableArray *fourViewImageMutArr;
    WYZQTaskObject *taskObject;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIView *fourView;
@property (weak, nonatomic) IBOutlet UIView *fiveView;
@property (weak, nonatomic) IBOutlet UILabel *fiveViewInfoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fiveImageView;
@property (weak, nonatomic) IBOutlet UIButton *zijintuoguanBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bidTimesByUserLabel;
@end
@implementation WYZQTaskDoingDetailContentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    twoViewImageMutArr = [NSMutableArray array];
    fourViewImageMutArr = [NSMutableArray array];
    self.scrollView.alwaysBounceVertical = YES;
    self.zijintuoguanBtn.layer.masksToBounds = YES;
    self.zijintuoguanBtn.layer.cornerRadius = 3.0f;
    self.zijintuoguanBtn.layer.borderColor = RGB(76, 190, 151).CGColor;
    self.zijintuoguanBtn.layer.borderWidth = 0.5f;
    self.bidTimesByUserLabel.layer.masksToBounds = YES;
    self.bidTimesByUserLabel.layer.cornerRadius = 3.0f;
    self.bidTimesByUserLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bidTimesByUserLabel.layer.borderWidth = 0.5f;
    self.fiveImageView.layer.masksToBounds = YES;
    self.fiveImageView.layer.cornerRadius = self.fiveImageView.frame.size.height/2.0f;
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height/2.0;
}
- (void)showContent:(WYZQTaskObject *)task{
    taskObject = task;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:task.publisherVartar] placeholderImage:PlaceholderImage];
    self.nameLabel.text = task.publisherName;
    self.bidTimesByUserLabel.text = task.bidTimesByUser;
    CGSize labelSize = [task.bidTimesByUser boundingRectWithSize:CGSizeMake(200, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} context:nil].size;
    [self.bidTimesByUserLabel setFrame:CGRectMake(self.bidTimesByUserLabel.frame.origin.x, self.bidTimesByUserLabel.frame.origin.y, labelSize.width + 10, self.bidTimesByUserLabel.frame.size.height)];
    UILabel *titleBuzhou = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
    titleBuzhou.text = @"任务步骤";
    titleBuzhou.font = [UIFont boldSystemFontOfSize:18.0f];
    titleBuzhou.textColor = TextColor;
    [self.twoView addSubview:titleBuzhou];
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:task.taskSteps];
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:4];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [task.taskSteps length])];
    labelSize = [task.taskSteps boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle1} context:nil].size;
    UILabel *contentBuzhou = [[UILabel alloc] initWithFrame:CGRectMake(15, titleBuzhou.frame.origin.y + titleBuzhou.frame.size.height + 10, labelSize.width, labelSize.height)];
    contentBuzhou.numberOfLines = 0;
    contentBuzhou.text = task.taskSteps;
    contentBuzhou.textColor = TextColor;
    contentBuzhou.font = [UIFont systemFontOfSize:14.0f];
    contentBuzhou.attributedText = attributedString1;
    [self.twoView addSubview:contentBuzhou];
    float originImageY = contentBuzhou.frame.origin.y + contentBuzhou.frame.size.height + 10;
    float originImageX = 15;
    float imageWidth = 0;
    for (int j = 0; j < task.taskStepImages.count; j++) {
        imageWidth = 90;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originImageX, originImageY, imageWidth, imageWidth)];
        imageView.clipsToBounds = YES;
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        imageView.userInteractionEnabled = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[task.taskStepImages objectAtIndex:j]] placeholderImage:PlaceholderImage];
        [self.twoView addSubview:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepTapAction:)];
        [imageView addGestureRecognizer:tap];
        originImageX = originImageX + imageWidth + 15;
        if (SCREEN_WIDTH_DEVICE - originImageX < imageWidth + 30) {
            originImageX = 15;
            if (j < task.taskStepImages.count-1) {
                originImageY = originImageY + imageWidth + 15;
            }
        }
        [self->twoViewImageMutArr addObject: imageView];
    }
    UIImageView *lineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, originImageY + imageWidth + 15, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView1 setBackgroundColor:LineBackgroundColor];
    [self.twoView addSubview:lineImageView1];
    [self.twoView setFrame:CGRectMake(0, 90, SCREEN_WIDTH_DEVICE, lineImageView1.frame.origin.y + lineImageView1.frame.size.height)];
    if (task.taskLinks.length > 0) {
        self.threeView.hidden = NO;
        UILabel *titleLinke = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
        titleLinke.text = @"任务相关链接";
        titleLinke.font = [UIFont boldSystemFontOfSize:18.0f];
        titleLinke.textColor = TextColor;
        [self.threeView addSubview:titleLinke];
        NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:task.taskLinks attributes:@{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
        CGSize labelSize = [task.taskLinks boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0]} context:nil].size;
        WZYLabel *contentLinke = [[WZYLabel alloc] initWithFrame:CGRectMake(15, titleLinke.frame.origin.y + titleLinke.frame.size.height + 10, labelSize.width, labelSize.height)];
        contentLinke.shouldGestureRecognizer = YES;
        contentLinke.copyEnable = YES;
        contentLinke.userInteractionEnabled = YES;
        contentLinke.numberOfLines = 0;
        contentLinke.text = task.taskLinks;
        contentLinke.textColor = RGB(85, 147, 253);
        contentLinke.font = [UIFont systemFontOfSize:14.0f];
        contentLinke.attributedText = attributedString2;
        [self.threeView addSubview:contentLinke];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lineCilicAction:)];
        [contentLinke addGestureRecognizer:tap];
        UIImageView *lineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, contentLinke.frame.origin.y + contentLinke.frame.size.height + 15, SCREEN_WIDTH_DEVICE, 10)];
        [lineImageView2 setBackgroundColor:LineBackgroundColor];
        [self.threeView addSubview:lineImageView2];
        [self.threeView setFrame:CGRectMake(0, self.twoView.frame.origin.y + self.twoView.frame.size.height, SCREEN_WIDTH_DEVICE, lineImageView2.frame.origin.y + lineImageView2.frame.size.height)];
    }else{
        self.threeView.hidden = YES;
    }
    self.fourView.hidden = NO;
    UILabel *titleYaoqiu = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
    titleYaoqiu.text = @"任务要求";
    titleYaoqiu.font = [UIFont boldSystemFontOfSize:18.0f];
    titleYaoqiu.textColor = TextColor;
    [self.fourView addSubview:titleYaoqiu];
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:task.taskRequirement];
    NSMutableParagraphStyle *paragraphStyle3 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle3 setLineSpacing:4];
    [attributedString3 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle3 range:NSMakeRange(0, [task.taskRequirement length])];
    labelSize = [task.taskRequirement boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle3} context:nil].size;
    UILabel *contentYaoqiu = [[UILabel alloc] initWithFrame:CGRectMake(15, titleYaoqiu.frame.origin.y + titleYaoqiu.frame.size.height + 10, labelSize.width, labelSize.height)];
    contentYaoqiu.numberOfLines = 0;
    contentYaoqiu.text = task.taskRequirement;
    contentYaoqiu.textColor = TextColor;
    contentYaoqiu.font = [UIFont systemFontOfSize:14.0f];
    contentYaoqiu.attributedText = attributedString3;
    [self.fourView addSubview:contentYaoqiu];
    originImageY = contentYaoqiu.frame.origin.y + contentYaoqiu.frame.size.height + 10;
    originImageX = 15;
    imageWidth = 0;
    for (int j = 0; j < task.taskRequirementImages.count; j++) {
        imageWidth = 90;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originImageX, originImageY, imageWidth, imageWidth)];
        imageView.clipsToBounds = YES;
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        imageView.userInteractionEnabled = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[task.taskRequirementImages objectAtIndex:j]] placeholderImage:PlaceholderImage];
        [self.fourView addSubview:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(requirementTapAction:)];
        [imageView addGestureRecognizer:tap];
        originImageX = originImageX + imageWidth + 15;
        if (SCREEN_WIDTH_DEVICE - originImageX < imageWidth + 30) {
            originImageX = 15;
            if (j < task.taskRequirementImages.count-1) {
                originImageY = originImageY + imageWidth + 15;
            }
        }
        [self->fourViewImageMutArr addObject: imageView];
    }
    UIImageView *lineImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, originImageY + imageWidth + 15, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView3 setBackgroundColor:LineBackgroundColor];
    [self.fourView addSubview:lineImageView3];
    if (self.threeView.hidden) {
        [self.fourView setFrame:CGRectMake(0, self.twoView.frame.origin.y + self.twoView.frame.size.height, SCREEN_WIDTH_DEVICE, lineImageView3.frame.origin.y + lineImageView3.frame.size.height)];
    }else{
        [self.fourView setFrame:CGRectMake(0, self.threeView.frame.origin.y + self.threeView.frame.size.height, SCREEN_WIDTH_DEVICE, lineImageView3.frame.origin.y + lineImageView3.frame.size.height)];
    }
    [self.fiveView setFrame:CGRectMake(0, self.fourView.frame.origin.y + self.fourView.frame.size.height, SCREEN_WIDTH_DEVICE, 50)];
    [self.scrollView setContentSize:CGSizeMake(0, self.fiveView.frame.origin.y + self.fiveView.frame.size.height)];
    self.fiveViewInfoLabel.text = [NSString stringWithFormat:@"%@位已赚", task.approvedUserCount];
    self.fiveViewInfoLabel = changeLabelAttribute(self.fiveViewInfoLabel, self.fiveViewInfoLabel.text.length - 3, 0, ThemeColor, TextColor, 14.0);
    NSInteger maxHeaderCount = (SCREEN_WIDTH_DEVICE - 140 - 20)/38;
    float headerWidth = 30;
    if (task.approveUserVartarsArr.count + 1 >= maxHeaderCount) {
        self.fiveImageView.hidden = NO;
        [self.fiveImageView setFrame:CGRectMake(15 + (headerWidth + 8) * maxHeaderCount, 10, headerWidth, headerWidth)];
    }else{
        self.fiveImageView.hidden = YES;
    }
    if (maxHeaderCount > task.approveUserVartarsArr.count) {
        maxHeaderCount = task.approveUserVartarsArr.count;
    }
    for (int i = 0; i < maxHeaderCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + (headerWidth + 8) * i , 10, headerWidth, headerWidth)];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = headerWidth/2.0f;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[task.approveUserVartarsArr objectAtIndex:i]] placeholderImage:PlaceholderImage];
        [self.fiveView addSubview:imageView];
    }
}
- (void)stepTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = self.twoView;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = twoViewImageMutArr.count;
    photoBrowser.currentImageIndex = [twoViewImageMutArr indexOfObject:imageView];
    photoBrowser.tagMut = 1;
    [photoBrowser show];
}
- (void)requirementTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = self.fourView;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = fourViewImageMutArr.count;
    photoBrowser.currentImageIndex = [fourViewImageMutArr indexOfObject:imageView];
    photoBrowser.tagMut = 2;
    [photoBrowser show];
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    if (photoBrowser.tagMut == 1) {
        UIImageView *imageView = twoViewImageMutArr[index];
        return imageView.image;
    }else{
        UIImageView *imageView = fourViewImageMutArr[index];
        return imageView.image;
    }
}
- (void)lineCilicAction:(UIGestureRecognizer *)gesture{
    UILabel *linkLabel = (UILabel *)gesture.view;
    if (taskObject.zidailiulangqi) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkLabel.text]];
    }else{
        WYZQWebShowViewController *viewCon = [[WYZQWebShowViewController alloc] initWithNibName:@"WYZQWebShowViewController" bundle:nil];
        viewCon.urlStr = linkLabel.text;
        [self.navigationController pushViewController:viewCon animated:YES];
    }
}
- (IBAction)guanzhuPress {
    WYZQFriendDetailViewController *viewCon = [[WYZQFriendDetailViewController alloc] initWithNibName:@"WYZQFriendDetailViewController" bundle:nil];
    viewCon.userId = taskObject.publisherPlatformId;
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
