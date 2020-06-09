#import "BWRZQFaBuYuLanViewController.h"
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
#import "BWRZQFaBuBuZhouObject.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "BWRZQFaBuSuccessViewController.h"
@interface BWRZQFaBuYuLanViewController ()<MIPhotoBrowserDelegate>{
    NSMutableArray *twoViewImageMutArr;
    NSMutableArray *fourViewImageMutArr;
    BWRZQTaskObject     *taskObject;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *surplusLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *fourView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *zijintuoguanBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bidTimesByUserLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;
@property (weak, nonatomic) IBOutlet UILabel *bottomInfoLabel;
@end
@implementation BWRZQFaBuYuLanViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布预览";
    [self addBackBtn];
    twoViewImageMutArr = [NSMutableArray array];
    fourViewImageMutArr = [NSMutableArray array];
    [self showContent];
    if (self.isEdit) {
        [self.sureBtn setTitle:@"修改任务" forState:UIControlStateNormal];
    }
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - IS_iPhoneX_Bottom - 64 - 44 - 44)];
    [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44 - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.sureBtn setFrame:CGRectMake(100, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE - 100, 44)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    [self.editBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, 100, 44)];
    self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 3, 0, [UIColor whiteColor], [UIColor whiteColor], 13.0);
    self.zijintuoguanBtn.layer.masksToBounds = YES;
    self.zijintuoguanBtn.layer.cornerRadius = 3.0f;
    self.zijintuoguanBtn.layer.borderColor = RGB(76, 190, 151).CGColor;
    self.zijintuoguanBtn.layer.borderWidth = 0.5f;
    self.bidTimesByUserLabel.layer.masksToBounds = YES;
    self.bidTimesByUserLabel.layer.cornerRadius = 3.0f;
    self.bidTimesByUserLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bidTimesByUserLabel.layer.borderWidth = 0.5f;
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height/2.0;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.bottomInfoLabel.text];
    [text addAttribute:NSForegroundColorAttributeName value:ThemeColor range:[self.bottomInfoLabel.text rangeOfString:@"《线上任务发布协议》"]];
    self.bottomInfoLabel.attributedText = text;
    [self.bottomInfoLabel yb_addAttributeTapActionWithStrings:@[@"《线上任务发布协议》"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
        viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/fabuProtocol/index.html", HOSTURL];
        [self.navigationController pushViewController:viewCon animated:YES];
    }];
}
- (IBAction)editPress {
    [self goBackAction];
}
- (IBAction)agreePress {
    self.agreeBtn.selected = !self.agreeBtn.selected;
}
- (IBAction)surePress {
    if (!self.agreeBtn.selected) {
        [self showHUDAlert:@"请同意发布协议"];
        return;
    }
    [self loadingHUDAlert:@"正在提交"];
    if (self.taskId.length > 0) {
        [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"task/published/%@", self.taskId] parameters:self.dic success:^(id responseObject) {
            [self hideHudAlert];
            [self showHUDAlert:@"修改成功"];
            if (self.RefreshHandle) {
                self.RefreshHandle();
            }
            [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - 3] animated:YES];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }else{
        [[ServiceRequest sharedService] POSTJSON:@"task" parameters:self.dic success:^(id responseObject) {
            [self hideHudAlert];
            BWRZQFaBuSuccessViewController *viewCon = [[BWRZQFaBuSuccessViewController alloc] initWithNibName:@"BWRZQFaBuSuccessViewController" bundle:nil];
                    viewCon.taskId = [responseObject objectForKey:@"taskNo"];
                    viewCon.taskCategoryStr = self.taskCategoryStr;
                    [self.navigationController pushViewController:viewCon animated:YES];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    }
}
- (void)showContent{
    UserInfo *user = [UserManger currentLoggedInUser];
    self.scrollView.hidden = NO;
    self.sureBtn.hidden = NO;
    self.titleLabel.text = [self.dic objectForKey:@"taskTitle"];
    self.taskTimeLabel.text = [NSString stringWithFormat:@"任务时间：%@", self.renwushijian];
    self.surplusLabel.text = [NSString stringWithFormat:@"剩余%@份 | %@后结束", [self.dic objectForKey:@"originalBidTime"], self.chixushijian];
    self.priceLabel.text = [NSString stringWithFormat:@"%@元/次", [self.dic objectForKey:@"sourceAmount"]];
    if (self.priceLabel.text.length > 0) {
        self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 3, 0, [UIColor whiteColor], [UIColor whiteColor], 13.0);
    }
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:user.avatar] placeholderImage:PlaceholderImage];
    self.nameLabel.text = user.nickname;
    self.bidTimesByUserLabel.text = [NSString stringWithFormat:@"每人可做%@", self.meigerencishu];
    CGSize labelSize = [self.bidTimesByUserLabel.text boundingRectWithSize:CGSizeMake(200, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]} context:nil].size;
    [self.bidTimesByUserLabel setFrame:CGRectMake(self.bidTimesByUserLabel.frame.origin.x, self.bidTimesByUserLabel.frame.origin.y, labelSize.width + 10, self.bidTimesByUserLabel.frame.size.height)];
    UILabel *titleJieShao = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
    titleJieShao.text = @"任务说明";
    titleJieShao.font = [UIFont boldSystemFontOfSize:18.0f];
    titleJieShao.textColor = TextColor;
    [self.oneView addSubview:titleJieShao];
    NSString *jieshaoStr = [self.dic objectForKey:@"taskDescription"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:jieshaoStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [jieshaoStr length])];
    labelSize = [jieshaoStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    UILabel *jieshaoLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, titleJieShao.frame.origin.y + titleJieShao.frame.size.height + 10, labelSize.width, labelSize.height)];
    jieshaoLabel.numberOfLines = 0;
    jieshaoLabel.text = jieshaoStr;
    jieshaoLabel.textColor = TextColor;
    jieshaoLabel.font = [UIFont systemFontOfSize:14.0f];
    jieshaoLabel.attributedText = attributedString;
    [self.oneView addSubview:jieshaoLabel];
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, jieshaoLabel.frame.origin.y + jieshaoLabel.frame.size.height + 15, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView setBackgroundColor:LineBackgroundColor];
    [self.oneView addSubview:lineImageView];
    [self.oneView setFrame:CGRectMake(0, 192, SCREEN_WIDTH_DEVICE, lineImageView.frame.origin.y + lineImageView.frame.size.height)];
    [self showBuZhouContentView];
    self.fourView.hidden = NO;
    UILabel *titleYaoqiu = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
    titleYaoqiu.text = @"需提交内容";
    titleYaoqiu.font = [UIFont boldSystemFontOfSize:18.0f];
    titleYaoqiu.textColor = TextColor;
    [self.fourView addSubview:titleYaoqiu];
    NSString *yaoqiuStr = [self.dic objectForKey:@"taskRequirement"];
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:yaoqiuStr];
    NSMutableParagraphStyle *paragraphStyle3 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle3 setLineSpacing:4];
    [attributedString3 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle3 range:NSMakeRange(0, [yaoqiuStr length])];
    labelSize = [yaoqiuStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle3} context:nil].size;
    UILabel *contentYaoqiu = [[UILabel alloc] initWithFrame:CGRectMake(15, titleYaoqiu.frame.origin.y + titleYaoqiu.frame.size.height + 10, labelSize.width, labelSize.height)];
    contentYaoqiu.numberOfLines = 0;
    contentYaoqiu.text = yaoqiuStr;
    contentYaoqiu.textColor = TextColor;
    contentYaoqiu.font = [UIFont systemFontOfSize:14.0f];
    contentYaoqiu.attributedText = attributedString3;
    [self.fourView addSubview:contentYaoqiu];
    float originImageY = contentYaoqiu.frame.origin.y + contentYaoqiu.frame.size.height + 10;
    float originImageX = 15;
    float imageWidth = 0;
    NSArray *taskRequirementImages = [self.dic objectForKey:@"taskRequirementImages"];
    for (int j = 0; j < taskRequirementImages.count; j++) {
        imageWidth = 90;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originImageX, originImageY, imageWidth, imageWidth)];
        imageView.clipsToBounds = YES;
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        imageView.userInteractionEnabled = YES;
        [imageView sd_setImageWithURL:[NSURL URLWithString:[taskRequirementImages objectAtIndex:j]] placeholderImage:PlaceholderImage];
        [self.fourView addSubview:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(requirementTapAction:)];
        [imageView addGestureRecognizer:tap];
        originImageX = originImageX + imageWidth + 15;
        if (SCREEN_WIDTH_DEVICE - originImageX < imageWidth + 30) {
            originImageX = 15;
            originImageY = originImageY + imageWidth + 15;
            if (j < taskRequirementImages.count-1) {
                originImageY = originImageY + imageWidth + 15;
            }
        }
        [self->fourViewImageMutArr addObject: imageView];
    }
    UIImageView *lineImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, originImageY + imageWidth + 15, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView3 setBackgroundColor:LineBackgroundColor];
    [self.fourView addSubview:lineImageView3];
    [self.fourView setFrame:CGRectMake(0, self.twoView.frame.origin.y + self.twoView.frame.size.height, SCREEN_WIDTH_DEVICE, lineImageView3.frame.origin.y + lineImageView3.frame.size.height)];
    [self.scrollView setContentSize:CGSizeMake(0, self.fourView.frame.origin.y + self.fourView.frame.size.height)];
}
#pragma mark ---显示任务步骤
- (void)showBuZhouContentView{
    UILabel *titleBuzhou = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 200, 30)];
    titleBuzhou.text = @"任务步骤";
    titleBuzhou.font = [UIFont boldSystemFontOfSize:18.0f];
    titleBuzhou.textColor = TextColor;
    [self.twoView addSubview:titleBuzhou];
    float originY = titleBuzhou.frame.origin.y + titleBuzhou.frame.size.height;
    UILabel *lastLineImage = nil;
    for (int i = 0; i < self.buzhouArr.count; i++) {
        UILabel *lineImage;
        BWRZQFaBuBuZhouObject *object = [self.buzhouArr objectAtIndex:i];
        UILabel *yuan = [[UILabel alloc] initWithFrame:CGRectMake(15, originY + 22 - 6, 12, 12)];
        yuan.layer.masksToBounds = YES;
        yuan.layer.cornerRadius = 6.0f;
        yuan.layer.borderWidth = 1.0f;
        yuan.layer.borderColor = ThemeColor.CGColor;
        [yuan setBackgroundColor:[UIColor whiteColor]];
        [self.twoView addSubview:yuan];
        if (lastLineImage) {
            [lastLineImage setFrame:CGRectMake(lastLineImage.frame.origin.x, lastLineImage.frame.origin.y, 1, yuan.frame.origin.y - lastLineImage.frame.origin.y)];
        };
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, 100, 44)];
        title.text = [self getBuZhouStr:i];
        title.textColor = TextColor;
        title.font = [UIFont systemFontOfSize:15.0f];
        [self.twoView addSubview:title];
        originY = originY + title.frame.size.height;
        CGSize labelSize = [self getBuzhouLabelSize:object.contentStr];
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:14.0f];
        contentLabel.textColor = TextColor;
        NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:object.contentStr];
        NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:4];
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [object.contentStr length])];
        contentLabel.attributedText = attributedString1;
        [self.twoView addSubview:contentLabel];
        if (object.type == 1) {
            originY = originY + object.contentLabel.frame.size.height + 15;
            lineImage = [[UILabel alloc] initWithFrame:CGRectMake(yuan.center.x - 0.5, yuan.center.y, 1, originY - 15 - yuan.center.y)];
            [lineImage setBackgroundColor:ThemeColor];
            [self.twoView addSubview:lineImage];
            [self.twoView sendSubviewToBack:lineImage];
        }else if (object.type == 2) {
            originY = originY + contentLabel.frame.size.height + 10;
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, originY, SCREEN_WIDTH_DEVICE - 35 - 8, 1)];
            [lineImageView setImage:[UIImage imageNamed:@"lineBottom"]];
            [self.twoView addSubview:lineImageView];
            originY = originY + 10;
            NSString *linkStr = object.linkStr;
            CGSize labelSize = [self getBuzhouLabelSize:linkStr];
            NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:linkStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [linkStr length])];
            WZYLabel *contentLinke = [[WZYLabel alloc] initWithFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
            contentLinke.shouldGestureRecognizer = YES;
            contentLinke.copyEnable = YES;
            contentLinke.userInteractionEnabled = YES;
            contentLinke.numberOfLines = 0;
            contentLinke.text = linkStr;
            contentLinke.textColor = RGB(85, 147, 253);
            contentLinke.font = [UIFont systemFontOfSize:14.0f];
            contentLinke.attributedText = attributedString2;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lineCilicAction:)];
            [contentLinke addGestureRecognizer:tap];
            [self.twoView addSubview:contentLinke];
            originY = originY + contentLinke.frame.size.height + 10;
            UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, originY, 110, 30)];
            infoLabel.textColor = TextColor;
            infoLabel.font = [UIFont systemFontOfSize:14.0f];
            infoLabel.text = @"直接点击链接或";
            [self.twoView addSubview:infoLabel];
            UIButton *copyBtn = [[UIButton alloc] initWithFrame:CGRectMake(140, originY, 80, 30)];
            [copyBtn setTitle:@"复制链接" forState:UIControlStateNormal];
            copyBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [copyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [copyBtn setBackgroundColor:ThemeColor];
            copyBtn.layer.masksToBounds = YES;
            copyBtn.layer.cornerRadius = 3.0f;
            copyBtn.tag = i;
            [copyBtn addTarget:self action:@selector(clickLinkPress:) forControlEvents:UIControlEventTouchUpInside];
            [self.twoView addSubview:copyBtn];
            originY = originY + copyBtn.frame.size.height + 15;
            lineImage = [[UILabel alloc] initWithFrame:CGRectMake(yuan.center.x - 0.5, yuan.center.y, 1, originY - 15 - yuan.center.y)];
            [lineImage setBackgroundColor:ThemeColor];
            [self.twoView addSubview:lineImage];
            [self.twoView sendSubviewToBack:lineImage];
        }else if (object.type == 3){
            originY = originY + contentLabel.frame.size.height + 10;
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, originY, SCREEN_WIDTH_DEVICE - 35 - 8, 1)];
            [lineImageView setImage:[UIImage imageNamed:@"lineBottom"]];
            [self.twoView addSubview:lineImageView];
            originY = originY + 10;
            NSString *fuzhiStr = object.fuzhiStr;
            CGSize labelSize = [self getBuzhouLabelSize:fuzhiStr];
            NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:fuzhiStr];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:4];
            [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [fuzhiStr length])];
            WZYLabel *fuzhiLabel = [[WZYLabel alloc] initWithFrame:CGRectMake(35, originY, labelSize.width, labelSize.height)];
            fuzhiLabel.shouldGestureRecognizer = YES;
            fuzhiLabel.copyEnable = YES;
            fuzhiLabel.userInteractionEnabled = YES;
            fuzhiLabel.numberOfLines = 0;
            fuzhiLabel.text = fuzhiStr;
            fuzhiLabel.textColor = TextColor;
            fuzhiLabel.font = [UIFont systemFontOfSize:14.0f];
            fuzhiLabel.attributedText = attributedString2;
            [self.twoView addSubview:fuzhiLabel];
            originY = originY + fuzhiLabel.frame.size.height + 10;
            UIButton *copyBtn = [[UIButton alloc] initWithFrame:CGRectMake(35, originY, 80, 30)];
            [copyBtn setTitle:@"复制内容" forState:UIControlStateNormal];
            copyBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [copyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [copyBtn setBackgroundColor:ThemeColor];
            copyBtn.layer.masksToBounds = YES;
            copyBtn.layer.cornerRadius = 3.0f;
            copyBtn.tag = i;
            [copyBtn addTarget:self action:@selector(copyContentPress:) forControlEvents:UIControlEventTouchUpInside];
            [self.twoView addSubview:copyBtn];
            originY = originY + copyBtn.frame.size.height + 15;
            lineImage = [[UILabel alloc] initWithFrame:CGRectMake(yuan.center.x - 0.5, yuan.center.y, 1, originY - 15 - yuan.center.y)];
            [lineImage setBackgroundColor:ThemeColor];
            [self.twoView addSubview:lineImage];
            [self.twoView sendSubviewToBack:lineImage];
        }
        NSMutableArray *imageMutArr = [NSMutableArray array];
        if (object.type == 1) {
            float originImageX = 35;
            float imageWidth = 90;
            for (int j = 0; j < object.images.count; j++) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originImageX, originY, imageWidth, imageWidth)];
                imageView.tag = i;
                imageView.clipsToBounds = YES;
                [imageView setContentMode:UIViewContentModeScaleAspectFill];
                imageView.userInteractionEnabled = YES;
                [imageView sd_setImageWithURL:[NSURL URLWithString:[object.images objectAtIndex:j]] placeholderImage:PlaceholderImage];
                [self.twoView addSubview:imageView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stepTapAction:)];
                [imageView addGestureRecognizer:tap];
                originImageX = originImageX + imageWidth + 15;
                if (SCREEN_WIDTH_DEVICE - originImageX < imageWidth + 30) {
                    originImageX = 35;
                    if (j < object.images.count - 1) {
                        originY = originY + imageWidth + 15;
                    }
                }
                [imageMutArr addObject: imageView];
            }
            if (imageMutArr.count > 0) {
                originY = originY + imageWidth + 10;
                [twoViewImageMutArr addObject:imageMutArr];
            }else{
                [imageMutArr addObject:[[UIImageView alloc] init]];
                [twoViewImageMutArr addObject:imageMutArr];
            }
            [lineImage setFrame:CGRectMake(yuan.center.x - 0.5, yuan.center.y, 1, originY - 10 - yuan.center.y)];
        }else{
            [imageMutArr addObject:[[UIImageView alloc] init]];
            [twoViewImageMutArr addObject:imageMutArr];
        }
        lastLineImage = lineImage;
    }
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, originY + 10, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView setBackgroundColor:LineBackgroundColor];
    [self.twoView addSubview:lineImageView];
    [self.twoView setFrame:CGRectMake(0, self.oneView.frame.origin.y + self.oneView.frame.size.height, SCREEN_WIDTH_DEVICE, lineImageView.frame.origin.y + lineImageView.frame.size.height)];
}
- (IBAction)guanzhuPress {
    UserInfo *user = [UserManger currentLoggedInUser];
    BWRZQFriendDetailViewController *viewCon = [[BWRZQFriendDetailViewController alloc] initWithNibName:@"BWRZQFriendDetailViewController" bundle:nil];
    viewCon.userId = user.userID;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)stepTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = imageView.superview;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = [[twoViewImageMutArr objectAtIndex:imageView.tag] count];
    photoBrowser.currentImageIndex = [[twoViewImageMutArr objectAtIndex:imageView.tag] indexOfObject:imageView];
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
        return ((UIImageView *)[[twoViewImageMutArr objectAtIndex:photoBrowser.currentImgaeView.tag] objectAtIndex:index]).image;
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
- (void)clickLinkPress:(id)sender{
    UIButton *btn = (UIButton *)sender;
    BWRZQFaBuBuZhouObject *object = [self.buzhouArr objectAtIndex:btn.tag];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = object.linkStr;
    [self showHUDAlert:@"复制成功"];
}
- (void)copyContentPress:(id)sender{
    UIButton *btn = (UIButton *)sender;
    BWRZQFaBuBuZhouObject *object = [self.buzhouArr objectAtIndex:btn.tag];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = object.fuzhiStr;
    [self showHUDAlert:@"复制成功"];
}
- (CGSize)getBuzhouLabelSize:(NSString *)content{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    CGSize labelSize = [content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 35 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return labelSize;
}
- (NSString *)getBuZhouStr:(NSInteger)index{
    if (index == 0) {
        return @"步骤一";
    }else if (index == 1){
        return @"步骤二";
    }else if (index == 2){
        return @"步骤三";
    }else if (index == 3){
        return @"步骤四";
    }else if (index == 4){
        return @"步骤五";
    }else if (index == 5){
        return @"步骤六";
    }else if (index == 6){
        return @"步骤七";
    }
    return @"结束";
}
@end
