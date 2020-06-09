#import "BWRZQTuiGuangViewController.h"
#import "TabBarView.h"
#import "GlobalFunction.h"
#import "ShareView.h"
#import "BWRZQShouTuDetailViewController.h"
#import "RefreshErrorAlertView.h"
#import "HYHScrollLabel.h"
@interface BWRZQTuiGuangViewController (){
    TabBarView                 *tabBarView;
    float                      bgImageViewHeight;
    BOOL                       againLoad;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *oneViewTopImageView;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIImageView *threeViewBottomImageView;
@property (weak, nonatomic) IBOutlet UILabel *yaoqingmaLabel;
@property (weak, nonatomic) IBOutlet UIImageView *twoLineImageView;
@property (weak, nonatomic) IBOutlet UILabel *jinriyaoqingshuLabel;
@property (weak, nonatomic) IBOutlet UILabel *leijiyaoqingshuLabel;
@property (weak, nonatomic) IBOutlet UILabel *leijijinbishuLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) HYHScrollLabel *paomadengLabel;
@end
@implementation BWRZQTuiGuangViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推广";
    tabBarView = [TabBarView sharedTabBarView];
    [self.navigationItem setHidesBackButton:YES];
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 50 - IS_iPhoneX_Bottom)];
    bgImageViewHeight = 245;
    [self.oneView setFrame:CGRectMake(15, 175, SCREEN_WIDTH_DEVICE - 30, self.oneView.frame.size.height)];
    if (SCREEN_WIDTH_DEVICE <= 320) {
        bgImageViewHeight = 245 * SCREEN_SCALE;
        [self.oneView setFrame:CGRectMake(15, 155, SCREEN_WIDTH_DEVICE - 30, self.oneView.frame.size.height)];
    }
    [self.bgImageView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, bgImageViewHeight)];
    addShadowToView(self.oneView, 0.3, 5.0f, 5.0f);
    [self.twoView setFrame:CGRectMake(15, self.oneView.frame.origin.y + self.oneView.frame.size.height + 15, SCREEN_WIDTH_DEVICE - 30, self.twoView.frame.size.height)];
    addShadowToView(self.twoView, 0.3, 5.0f, 5.0f);
    [self.threeView setFrame:CGRectMake(15, self.twoView.frame.origin.y + self.twoView.frame.size.height + 15, SCREEN_WIDTH_DEVICE - 30, self.threeView.frame.size.height)];
    addShadowToView(self.threeView, 0.3, 5.0f, 5.0f);
    self.threeViewBottomImageView.layer.masksToBounds = YES;
    self.threeViewBottomImageView.layer.cornerRadius = 17.5f;
    [self.scrollView setContentSize:CGSizeMake(0, self.threeView.frame.origin.y + self.threeView.frame.size.height + 15)];
    UIButton *sureBtn = [self addRigthBtn:@"规则" withButtonColor:ThemeColor];
    [sureBtn addTarget:self action:@selector(rulePress) forControlEvents:UIControlEventTouchUpInside];
    self.oneViewTopImageView.layer.masksToBounds = YES;
    self.oneViewTopImageView.layer.cornerRadius = 15.0f;
    self.twoLineImageView.image = [self drawLineOfDashByImageView:self.twoLineImageView];
    self.jinriyaoqingshuLabel = changeLabelAttribute(self.jinriyaoqingshuLabel, self.jinriyaoqingshuLabel.text.length - 1, 0, ThemeColor, TextLightColor, 13.0);
    self.leijiyaoqingshuLabel = changeLabelAttribute(self.leijiyaoqingshuLabel, self.leijiyaoqingshuLabel.text.length - 1, 0, ThemeColor, TextLightColor, 13.0);
    self.leijijinbishuLabel = changeLabelAttribute(self.leijijinbishuLabel, self.leijijinbishuLabel.text.length - 1, 0, ThemeColor, TextLightColor, 13.0);
    [self requestContent];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.fd_interactivePopDisabled = YES;
    [self.view addSubview:tabBarView];
    [tabBarView setCurrentViewControllerIndex:2];
    UserInfo *user = [UserManger currentLoggedInUser];
    self.yaoqingmaLabel.text = user.yaoqingma;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (againLoad) {
        [self requestContent];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.fd_interactivePopDisabled = NO;
    againLoad = YES;
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/share-info", user.userID]];
}
- (void)rulePress{
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/shareRule.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)sharePress {
    UserInfo *user = [UserManger currentLoggedInUser];
    ShareView *shareView = [[ShareView alloc] initItemContent:SHARECONTENT withTitle:SHARETITLE withUrl:[NSString stringWithFormat:@"http://share.shangjinxia.ltd/#/login?shareCode=%@", user.yaoqingma] withShareicon:nil];
    [self.view.window addSubview:shareView];
}
- (IBAction)copyPress {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.yaoqingmaLabel.text;
    [self showHUDAlert:@"复制成功，粘贴分享给好友"];
}
- (IBAction)shoutuDetailPress {
    BWRZQShouTuDetailViewController *viewCon = [[BWRZQShouTuDetailViewController alloc] initWithNibName:@"BWRZQShouTuDetailViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)requestContent{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/share-info", user.userID] parameters:nil success:^(id responseObject) {
        self.jinriyaoqingshuLabel.text = [NSString stringWithFormat:@"%@人", [responseObject objectForKey:@"shareUserTodayCount"]];
        self.leijiyaoqingshuLabel.text = [NSString stringWithFormat:@"%@人", [responseObject objectForKey:@"shareUserAllCount"]];
        self.leijijinbishuLabel.text = [NSString stringWithFormat:@"%@个", [responseObject objectForKey:@"shareUserCoinCount"]];
        self.infoLabel.text = [responseObject objectForKey:@"shareRewardDescription"];
        if (!self.paomadengLabel) {
            self.paomadengLabel = [[HYHScrollLabel alloc] initWithFrame:CGRectMake(52, 15, SCREEN_WIDTH_DEVICE - 52 - 27 - 30, 30) andTitls:[NSArray arrayWithObjects:[responseObject objectForKey:@"shareTips"], nil]];
            self.paomadengLabel.labelColor = RGB(178, 133, 84);
            self.paomadengLabel.labelFont = [UIFont systemFontOfSize:13.0f];
            self.paomadengLabel.volacity = 1.0;
            [self.paomadengLabel beiginScroll];
            [self.oneView addSubview:self.paomadengLabel];
        }
    } failure:^(NSString *error, NSInteger code) {
    }];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset < 0) {
        CGFloat factor = ((ABS(yOffset)+(bgImageViewHeight ))*SCREEN_WIDTH_DEVICE)/(bgImageViewHeight);
        CGRect f = CGRectMake((SCREEN_WIDTH_DEVICE - factor)/2.0, 64 + IS_iPhoneX_Top, factor, (bgImageViewHeight)+ABS(yOffset));
        self.bgImageView.frame = f;
    } else {
        if (yOffset < (bgImageViewHeight + IS_iPhoneX_Top)) {
            CGRect f = self.bgImageView.frame;
            f.origin.y = -yOffset + (64 + IS_iPhoneX_Top);
            self.bgImageView.frame = f;
        }
    }
}
- (UIImage *)drawLineOfDashByImageView:(UIImageView *)imageView {
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(line, kCGLineCapRound);
    CGFloat lengths[] = {2,1};
    CGContextSetStrokeColorWithColor(line, ThemeColor.CGColor);
    CGContextSetLineDash(line, 0, lengths, 1);
    CGContextMoveToPoint(line, 0.0, 1.0);
    CGContextAddLineToPoint(line, 300, 1.0);
    CGContextStrokePath(line);
    return UIGraphicsGetImageFromCurrentImageContext();
}
@end
