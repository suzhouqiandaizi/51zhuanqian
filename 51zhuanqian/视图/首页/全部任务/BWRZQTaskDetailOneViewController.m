#import "BWRZQTaskDetailOneViewController.h"
#import "ShareView.h"
#import "GlobalFunction.h"
#import "MIPhotoBrowser.h"
#import "BWRZQTaskButton.h"
#import "BWRZQSubmitTaskViewController.h"
#import "BWRZQFriendDetailViewController.h"
#import "BWRZQTaskObject.h"
#import "BWRZQReportViewController.h"
#import "UIActionSheet+Blocks.h"
#import "WZYLabel.h"
#import "LoadConfig.h"
@interface BWRZQTaskDetailOneViewController ()<MIPhotoBrowserDelegate>{
    NSMutableArray *twoViewImageMutArr;
    NSMutableArray *fourViewImageMutArr;
    BWRZQTaskObject     *taskObject;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *surplusLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIView *fourView;
@property (weak, nonatomic) IBOutlet UIView *fiveView;
@property (weak, nonatomic) IBOutlet UILabel *fiveViewInfoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fiveImageView;
@property (weak, nonatomic) IBOutlet BWRZQTaskButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *zijintuoguanBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bidTimesByUserLabel;
@property (weak, nonatomic) IBOutlet UIView *bannerContentView;
@property (weak, nonatomic) IBOutlet UIButton *closeBannerBtn;
@end
@implementation BWRZQTaskDetailOneViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务详情";
    [self addBackBtn];
    UIButton *sureBtn = [self addRigthBtnImage:@"renwufenzu"];
    [sureBtn addTarget:self action:@selector(sharePress) forControlEvents:UIControlEventTouchUpInside];
    twoViewImageMutArr = [NSMutableArray array];
    fourViewImageMutArr = [NSMutableArray array];
    [self requestContent];
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - IS_iPhoneX_Bottom - 64 - 44)];
    self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 3, 0, [UIColor whiteColor], [UIColor whiteColor], 13.0);
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
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/%@", self.taskId]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task-order/%@/%@/bid", user.userID, self.taskId]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/black-list/%@", taskObject.publisherPlatformId]];
}
- (void)requestContent{
    [self loadingHUDAlert:@"正在加载"];
    self.scrollView.hidden = YES;
    self.sureBtn.hidden = YES;
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/%@", self.taskId] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        self.scrollView.hidden = NO;
        self.sureBtn.hidden = NO;
        NSDictionary *contentDic = responseObject;
        [self.sureBtn setTaskButtonTitle:[contentDic objectForKey:@"statusLabel"] withStatus:[contentDic objectForKey:@"taskStatus"]];
        BWRZQTaskObject *task = [BWRZQTaskObject taskDetailDic:contentDic];
        self->taskObject = task;
        self.titleLabel.text = task.title;
        self.taskTimeLabel.text = [NSString stringWithFormat:@"任务时间：%@", task.bidSubmitDurationHours];
        self.surplusLabel.text = [NSString stringWithFormat:@"剩余%@份 · %@", task.leftBidTime, task.endTimeDisplay];
        self.priceLabel.text = task.rewardAmountDisplay;
        if (self.priceLabel.text.length > 0) {
            self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 3, 0, [UIColor whiteColor], [UIColor whiteColor], 13.0);
        }
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
        [self.twoView setFrame:CGRectMake(0, 192, SCREEN_WIDTH_DEVICE, lineImageView1.frame.origin.y + lineImageView1.frame.size.height)];
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
                originImageY = originImageY + imageWidth + 15;
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
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)sharePress{
    NSArray *titleBtns = [NSArray arrayWithObjects:@"分享给好友",@"加入黑名单并屏蔽",@"投诉举报", nil];
    [UIActionSheet showInView:self.view withTitle:@"请选择一项" cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:titleBtns tapBlock:^(UIActionSheet * _Nonnull actionSheet, NSInteger buttonIndex) {
        if (buttonIndex==0) {
            UserInfo *user = [UserManger currentLoggedInUser];
            ShareView *shareView = [[ShareView alloc] initItemContent:[NSString stringWithFormat:@"您的好友邀请您一块来做\"%@\"任务", self.titleLabel.text] withTitle:SHARETITLE withUrl:[NSString stringWithFormat:@"http://winner.shangjinxia.ltd/#/pages/views/release-task-detail-doing/release-task-detail-doing-share?taskNo=%@&shareCode=%@", self.taskId, user.yaoqingma] withShareicon:nil];
            [self.view.window addSubview:shareView];
        }else if (buttonIndex==1){
            [self loadingHUDAlert:@"正在操作"];
            [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"user/black-list/%@", self->taskObject.publisherPlatformId] parameters:nil success:^(id responseObject) {
                [self hideHudAlert];
                [self showHUDAlert:@"已加入黑名单"];
            } failure:^(NSString *error, NSInteger code) {
                [self hideHudAlert];
                [self showHUDAlert:error];
            }];
        }else if (buttonIndex==2){
            BWRZQReportViewController *viewCon = [[BWRZQReportViewController alloc] initWithNibName:@"BWRZQReportViewController" bundle:nil];
            viewCon.taskId = self.taskId;
            [self.navigationController pushViewController:viewCon animated:YES];
        }
    }];
}
- (IBAction)guanzhuPress {
    BWRZQFriendDetailViewController *viewCon = [[BWRZQFriendDetailViewController alloc] initWithNibName:@"BWRZQFriendDetailViewController" bundle:nil];
    viewCon.userId = taskObject.publisherPlatformId;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)taskButtonPress:(id)sender {
    if (self.sureBtn.type == TaskType_dailingqu) {
        [self loadingHUDAlert:@"正在领取"];
        UserInfo *user = [UserManger currentLoggedInUser];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:user.userID forKey:@"platformId"];
        [dic setObject:self.taskId forKey:@"taskNo"];
        [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"task-order/%@/%@/bid", user.userID, self.taskId] parameters:dic success:^(id responseObject) {
            [self hideHudAlert];
            [self refreshContent];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
        }];
    }else if (self.sureBtn.type == TaskType_daitijiao){
        BWRZQSubmitTaskViewController *viewCon = [[BWRZQSubmitTaskViewController alloc] initWithNibName:@"BWRZQSubmitTaskViewController" bundle:nil];
        viewCon.task = taskObject;
        viewCon.RefreshHandle = ^{
            [self refreshContent];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    }else{
    }
}
- (void)refreshContent{
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/%@", self.taskId] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        NSDictionary *contentDic = responseObject;
        [self.sureBtn setTaskButtonTitle:[contentDic objectForKey:@"statusLabel"] withStatus:[contentDic objectForKey:@"taskStatus"]];
        BWRZQTaskObject *task = [BWRZQTaskObject taskDetailDic:contentDic];
        self->taskObject = task;
        self.titleLabel.text = task.title;
        self.taskTimeLabel.text = [NSString stringWithFormat:@"任务时间：%@", task.bidSubmitDurationHours];
        self.surplusLabel.text = [NSString stringWithFormat:@"剩余%@份 · %@", task.leftBidTime, task.endTimeDisplay];
        self.bidTimesByUserLabel.text = task.bidTimesByUser;
        CGSize labelSize = [task.bidTimesByUser boundingRectWithSize:CGSizeMake(200, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} context:nil].size;
        [self.bidTimesByUserLabel setFrame:CGRectMake(self.bidTimesByUserLabel.frame.origin.x, self.bidTimesByUserLabel.frame.origin.y, labelSize.width + 10, self.bidTimesByUserLabel.frame.size.height)];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
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
        BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
        viewCon.urlStr = linkLabel.text;
        [self.navigationController pushViewController:viewCon animated:YES];
    }
}
@end
