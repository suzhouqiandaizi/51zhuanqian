#import "BWRZQPersonViewController.h"
#import "TabBarView.h"
#import "BWRZQLoginViewController.h"
#import "SRRefreshView.h"
#import "BWRZQSettingViewController.h"
#import "BWRZQMyTaskViewController.h"
#import "LoadConfig.h"
#import "GlobalFunction.h"
#import "LXGradientProcessView.h"
#import "BWRZQTixianViewController.h"
#import "BWRZQSaleCoinViewController.h"
#import "BWRZQCoinRecordDetailViewController.h"
#import "BWRZQMessageViewController.h"
#import "BWRZQTaskDoingViewController.h"
#import "BWRZQTaskFabuViewController.h"
#import "BWRZQAttentionFunsViewController.h"
#import "BWRZQPersonInfoViewController.h"
#import "BWRZQTixianAgainViewController.h"
@interface BWRZQPersonViewController ()<SRRefreshDelegate>{
    TabBarView                 *tabBarView;
    UserInfo                   *user;
    BOOL                       hasloaded;
    BOOL                       personInfoLoaded;
    BOOL                       messageLoaded;
    BOOL                       taskLoaded;
    NSDictionary               *taskNumDic;
    NSString                   *creditValue;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) SRRefreshView         *slimeView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gradeImageView;
@property (weak, nonatomic) IBOutlet UILabel *guanzhuLabel;
@property (weak, nonatomic) IBOutlet UILabel *fensiLabel;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet UIView *fourView;
@property (nonatomic, strong) LXGradientProcessView *processView;
@property (weak, nonatomic) IBOutlet UIButton *tixianBtn;
@property (weak, nonatomic) IBOutlet UIButton *zhanghuBtn;
@property (weak, nonatomic) IBOutlet UIButton *chushouBtn;
@property (weak, nonatomic) IBOutlet UIButton *jinbiBtn;
@property (weak, nonatomic) IBOutlet UIImageView *levelImageView;
@property (weak, nonatomic) IBOutlet UILabel *balanceAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceCoinAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditValueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *messageDotImageView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageTipLabel;
@property (weak, nonatomic) IBOutlet UILabel *myOrderFailedCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *myOrderGotMoneyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *myOrderReadyToApproveCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *myOrderReadyToSubmitOrderCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *myOrderRejectCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskCompleteCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskInprocessCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskReadyToPayCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskReadyToSubmitOrderCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskRejectCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskWaitToEndCountLabel;
@property (weak, nonatomic) IBOutlet UIImageView *zhanghulineImage;
@property (weak, nonatomic) IBOutlet UIImageView *jinbilineImage;
@end
@implementation BWRZQPersonViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    tabBarView = [TabBarView sharedTabBarView];
    [self.navigationItem setHidesBackButton:YES];
    user = [UserManger currentLoggedInUser];
    hasloaded = NO;
    [self.scrollView addSubview:self.slimeView];
    [self loadingHUDAlert:@"正在加载"];
    [self showContentView];
    self.scrollView.hidden = YES;
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 50 - IS_iPhoneX_Bottom - IS_iPhoneX_Top - 64)];
    UIButton *sureBtn = [self addRigthBtnImage:@"wo_shezhi_btn"];
    [sureBtn addTarget:self action:@selector(settingPress) forControlEvents:UIControlEventTouchUpInside];
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = 30.0f;
    self.messageDotImageView.layer.masksToBounds = YES;
    self.messageDotImageView.layer.cornerRadius = self.messageDotImageView.frame.size.width/2.0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guanzhuPress:)];
    [self.guanzhuLabel addGestureRecognizer:tap];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(funsPress:)];
    [self.fensiLabel addGestureRecognizer:tap2];
    float leftRightViewWidth = (SCREEN_WIDTH_DEVICE - 45)/2.0f;
    [self.leftView setFrame:CGRectMake(15, self.leftView.frame.origin.y, leftRightViewWidth, self.leftView.frame.size.height)];
    [self.rightView setFrame:CGRectMake(30 + leftRightViewWidth, self.rightView.frame.origin.y, leftRightViewWidth, self.rightView.frame.size.height)];
    addShadowToView(self.leftView, 0.3, 5.0f, 5.0f);
    addShadowToView(self.rightView, 0.3, 5.0f, 5.0f);
    float btnWidth = 68;
    if ([[[[LoadConfig shareStance] getConfig] objectForKey:@"releaseTask"] isEqualToString:@"NO"]) {
        self.tixianBtn.hidden = YES;
        self.chushouBtn.hidden = YES;
        self.zhanghulineImage.hidden = YES;
        self.jinbilineImage.hidden = YES;
        [self.zhanghuBtn setFrame:CGRectMake(((leftRightViewWidth - 68)/4.0)*2, 71, btnWidth, 35)];
        [self.jinbiBtn setFrame:CGRectMake(((leftRightViewWidth - 68)/4.0)*2, 71, btnWidth, 35)];
    }else{
        [self.tixianBtn setFrame:CGRectMake((leftRightViewWidth - 68 * 2)/3.0, 71, btnWidth, 35)];
        [self.zhanghuBtn setFrame:CGRectMake(((leftRightViewWidth - 68 * 2)/3.0)*2 + btnWidth  + 4, 71, btnWidth, 35)];
        [self.chushouBtn setFrame:CGRectMake((leftRightViewWidth - 68 * 2)/3.0, 71, btnWidth, 35)];
        [self.jinbiBtn setFrame:CGRectMake(((leftRightViewWidth - 68 * 2)/3.0)*2 + btnWidth + 4, 71, btnWidth, 35)];
    }
    [self.oneView setFrame:CGRectMake(15, self.leftView.frame.origin.y + self.leftView.frame.size.height + 15, SCREEN_WIDTH_DEVICE - 30, self.oneView.frame.size.height)];
    addShadowToView(self.oneView, 0.3, 5.0f, 5.0f);
    [self.twoView setFrame:CGRectMake(15, self.oneView.frame.origin.y + self.oneView.frame.size.height + 15, SCREEN_WIDTH_DEVICE - 30, self.twoView.frame.size.height)];
    addShadowToView(self.twoView, 0.3, 5.0f, 5.0f);
    [self.threeView setFrame:CGRectMake(15, self.twoView.frame.origin.y + self.twoView.frame.size.height + 15, SCREEN_WIDTH_DEVICE - 30, self.threeView.frame.size.height)];
    addShadowToView(self.threeView, 0.3, 5.0f, 5.0f);
    [self.fourView setFrame:CGRectMake(15, self.threeView.frame.origin.y + self.threeView.frame.size.height + 15, SCREEN_WIDTH_DEVICE - 30, self.fourView.frame.size.height)];
    addShadowToView(self.fourView, 0.3, 5.0f, 5.0f);
    [self.scrollView setContentSize:CGSizeMake(0, self.fourView.frame.origin.y + self.fourView.frame.size.height + 15)];
    self.processView = [[LXGradientProcessView alloc] initWithFrame:CGRectMake(15.f, 43, SCREEN_WIDTH_DEVICE - 60.f, 20.f) withColorArr:nil withColorLocationArr:nil];
    [self.fourView addSubview:self.processView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.fd_interactivePopDisabled = YES;
    [self.view addSubview:tabBarView];
    [tabBarView setCurrentViewControllerIndex:3];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (hasloaded) {
        [self showContentView];
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.fd_interactivePopDisabled = NO;
    hasloaded = YES;
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@", user.userID]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/message-basic-info", user.userID]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/task-info", user.userID]];
}
- (void)showContentView{
    user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@", user.userID] parameters:nil success:^(id responseObject) {
        self->personInfoLoaded = YES;
        [self hasLoadedAll];
        NSDictionary *contentDic = responseObject;
        NSString *nameStr = [contentDic objectForKey:@"nickName"];
        self.nameLabel.text = nameStr;
        CGSize labelSize = [nameStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 83 - 140, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0]} context:nil].size;
        [self.nameLabel setFrame:CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y, labelSize.width + 8, self.nameLabel.frame.size.height)];
        [self.gradeImageView setFrame:CGRectMake(self.nameLabel.frame.origin.x + self.nameLabel.frame.size.width, self.gradeImageView.frame.origin.y, self.gradeImageView.frame.size.width, self.gradeImageView.frame.size.height)];
        NSString *guanzhu = [NSString stringWithFormat:@"%@关注", [contentDic objectForKey:@"attentionCount"]];
        self.guanzhuLabel.text = guanzhu;
        labelSize = [guanzhu boundingRectWithSize:CGSizeMake(100, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size;
        [self.guanzhuLabel setFrame:CGRectMake(self.guanzhuLabel.frame.origin.x, self.guanzhuLabel.frame.origin.y, labelSize.width + 15, self.guanzhuLabel.frame.size.height)];
        NSString *fensi = [NSString stringWithFormat:@"%@粉丝", [contentDic objectForKey:@"fansCount"]];
        self.fensiLabel.text = fensi;
        labelSize = [fensi boundingRectWithSize:CGSizeMake(100, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size;
        [self.fensiLabel setFrame:CGRectMake(self.guanzhuLabel.frame.origin.x + self.guanzhuLabel.frame.size.width, self.guanzhuLabel.frame.origin.y, labelSize.width + 15, self.fensiLabel.frame.size.height)];
        self.guanzhuLabel = changeLabelAttribute(self.guanzhuLabel, self.guanzhuLabel.text.length - 2, 0, TextColor, [UIColor lightGrayColor], 13.0);
        self.fensiLabel = changeLabelAttribute(self.fensiLabel, self.fensiLabel.text.length - 2, 0, TextColor, [UIColor lightGrayColor], 13.0);
        [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"avatar"]] placeholderImage:PlaceholderImage];
        [self.gradeImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"userLevelIcon"]]];
        [self.levelImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"creditLevelIcon"]]];
        self.balanceAmountLabel.text = [NSString stringWithFormat:@"%.2f", [[contentDic objectForKey:@"balanceAmount"] floatValue]];
        self.balanceCoinAmountLabel.text = [NSString stringWithFormat:@"%@", [contentDic objectForKey:@"balanceCoinAmount"]];
        self->creditValue = [contentDic objectForKey:@"creditValue"];
        self.creditValueLabel.text = [NSString stringWithFormat:@"成长值 %@", self->creditValue];
        self.processView.percent = [[contentDic objectForKey:@"creditPercent"] doubleValue] * 100;
        UserInfo *user = [UserManger currentLoggedInUser];
        user.nickname = [contentDic objectForKey:@"nickName"];
        user.avatar = [contentDic objectForKey:@"avatar"];
        user.availableAmount = self.balanceAmountLabel.text;
        user.availableJinbi = self.balanceCoinAmountLabel.text;
        [UserManger setUser:user];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/message-basic-info", user.userID] parameters:nil success:^(id responseObject) {
        self->messageLoaded = YES;
        [self hasLoadedAll];
        NSDictionary *contentDic = responseObject;
        self.messageLabel.text = [contentDic objectForKey:@"latestMessageTitle"];
        NSInteger unreadCount = [[contentDic objectForKey:@"unreadCount"] integerValue];
        if (unreadCount > 0) {
            [self.messageLabel setFrame:CGRectMake(70, self.messageLabel.frame.origin.y, self.messageLabel.frame.size.width, self.messageLabel.frame.size.height)];
            self.messageTipLabel.text = [NSString stringWithFormat:@"%ld条未读", (long)unreadCount];
            self.messageTipLabel.textColor = ThemeColor;
            self.messageDotImageView.hidden = NO;
        }else{
            [self.messageLabel setFrame:CGRectMake(57, self.messageLabel.frame.origin.y, self.messageLabel.frame.size.width, self.messageLabel.frame.size.height)];
            self.messageTipLabel.text = @"查看全部";
            self.messageTipLabel.textColor = TextLightColor;
            self.messageDotImageView.hidden = YES;
        }
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/task-info", user.userID] parameters:nil success:^(id responseObject) {
        self->taskLoaded = YES;
        [self hasLoadedAll];
        NSDictionary *contentDic = responseObject;
        self->taskNumDic = contentDic;
        self.myOrderFailedCountLabel.text = [NSString stringWithFormat:@"任务失败(%@)", [contentDic objectForKey:@"myOrderFailedCount"]];
        self.myOrderGotMoneyCountLabel.text = [NSString stringWithFormat:@"已获赏(%@)", [contentDic objectForKey:@"myOrderGotMoneyCount"]];
        self.myOrderReadyToApproveCountLabel.text = [NSString stringWithFormat:@"待审核(%@)", [contentDic objectForKey:@"myOrderReadyToApproveCount"]];
        self.myOrderReadyToSubmitOrderCountLabel.text = [NSString stringWithFormat:@"待提交(%@)", [contentDic objectForKey:@"myOrderReadyToSubmitOrderCount"]];
        self.myOrderRejectCountLabel.text = [NSString stringWithFormat:@"已拒绝(%@)", [contentDic objectForKey:@"myOrderRejectCount"]];
        self.taskCompleteCountLabel.text = [NSString stringWithFormat:@"已结束(%@)", [contentDic objectForKey:@"taskCompleteCount"]];
        self.taskInprocessCountLabel.text = [NSString stringWithFormat:@"进行中(%@)", [contentDic objectForKey:@"taskInprocessCount"]];
        self.taskReadyToPayCountLabel.text = [NSString stringWithFormat:@"待付款(%@)", [contentDic objectForKey:@"taskReadyToPayCount"]];
        self.taskReadyToSubmitOrderCountLabel.text = [NSString stringWithFormat:@"待审核(%@)", [contentDic objectForKey:@"taskReadyToSubmitOrderCount"]];
        self.taskRejectCountLabel.text = [NSString stringWithFormat:@"审核失败(%@)", [contentDic objectForKey:@"taskRejectCount"]];
        self.taskWaitToEndCountLabel.text = [NSString stringWithFormat:@"等待结束(%@)", [contentDic objectForKey:@"taskWaitToEndCount"]];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
- (void)hasLoadedAll{
    if (personInfoLoaded && messageLoaded && taskLoaded) {
        [self hideHudAlert];
        self.scrollView.hidden = NO;
    }
}
- (void)settingPress {
    BWRZQSettingViewController *viewCon = [[BWRZQSettingViewController alloc] initWithNibName:@"BWRZQSettingViewController" bundle:nil];
    viewCon.RefreshHandle = ^(){
        [self showContentView];
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)tixianPress {
    [self loadingHUDAlert:@"请稍候"];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/account-info", user.userID] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        NSString *accountStr = [responseObject objectForKey:@"account"];
        if (accountStr.length > 0) {
            BWRZQTixianAgainViewController *viewCon = [[BWRZQTixianAgainViewController alloc] initWithNibName:@"BWRZQTixianAgainViewController" bundle:nil];
            viewCon.dic = responseObject;
            [self.navigationController pushViewController:viewCon animated:YES];
        }else{
            BWRZQTixianViewController *viewCon = [[BWRZQTixianViewController alloc] initWithNibName:@"BWRZQTixianViewController" bundle:nil];
            viewCon.dic = responseObject;
            [self.navigationController pushViewController:viewCon animated:YES];
        }
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (IBAction)saleCoinPress {
    BWRZQSaleCoinViewController *viewCon = [[BWRZQSaleCoinViewController alloc] initWithNibName:@"BWRZQSaleCoinViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)cashRecordPress {
    BWRZQCoinRecordDetailViewController *viewCon = [[BWRZQCoinRecordDetailViewController alloc] initWithNibName:@"BWRZQCoinRecordDetailViewController" bundle:nil];
    viewCon.type = RecordType_cash;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)coinRecordPress {
    BWRZQCoinRecordDetailViewController *viewCon = [[BWRZQCoinRecordDetailViewController alloc] initWithNibName:@"BWRZQCoinRecordDetailViewController" bundle:nil];
    viewCon.type = RecordType_coin;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)messagePress {
    BWRZQMessageViewController *viewCon = [[BWRZQMessageViewController alloc] initWithNibName:@"BWRZQMessageViewController" bundle:nil];
    viewCon.taskNumDic = taskNumDic;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)taskDoingPress:(id)sender {
    BWRZQTaskDoingViewController *viewCon = [[BWRZQTaskDoingViewController alloc] initWithNibName:@"BWRZQTaskDoingViewController" bundle:nil];
    UIButton *btn = (UIButton *)sender;
    viewCon.taskNumDic = taskNumDic;
    viewCon.selectedIndex = btn.tag - 2000;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)fabuPress:(id)sender {
    BWRZQTaskFabuViewController *viewCon = [[BWRZQTaskFabuViewController alloc] initWithNibName:@"BWRZQTaskFabuViewController" bundle:nil];
    UIButton *btn = (UIButton *)sender;
    viewCon.taskNumDic = taskNumDic;
    viewCon.selectedIndex = btn.tag - 3000;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)tixishuomingPress {
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/#/pages/views/xytx/xytx?creditValue=%@", HOSTH5, [creditValue substringToIndex:[creditValue rangeOfString:@"/"].location]];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)zhanghuPress {
    BWRZQPersonInfoViewController *viewCon = [[BWRZQPersonInfoViewController alloc] initWithNibName:@"BWRZQPersonInfoViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)guanzhuPress:(UIGestureRecognizer *)gesture{
    BWRZQAttentionFunsViewController *viewCon = [[BWRZQAttentionFunsViewController alloc] initWithNibName:@"BWRZQAttentionFunsViewController" bundle:nil];
    viewCon.selectedIndex = 0;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)funsPress:(UIGestureRecognizer *)gesture{
    BWRZQAttentionFunsViewController *viewCon = [[BWRZQAttentionFunsViewController alloc] initWithNibName:@"BWRZQAttentionFunsViewController" bundle:nil];
    viewCon.selectedIndex = 1;
    [self.navigationController pushViewController:viewCon animated:YES];
}
#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_slimeView scrollViewDidScroll];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_slimeView scrollViewDidEndDraging];
}
#pragma mark - slimeRefresh delegate
- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
{
    [self showContentView];
    [_slimeView endRefresh];
}
- (SRRefreshView *)slimeView
{
    if (!_slimeView) {
        _slimeView = [[SRRefreshView alloc] init];
        _slimeView.delegate = self;
        _slimeView.upInset = 0;
        _slimeView.slimeMissWhenGoingBack = YES;
        _slimeView.slime.bodyColor = [UIColor lightGrayColor];
        _slimeView.slime.skinColor = [UIColor lightGrayColor];
        _slimeView.slime.lineWith = 1;
        _slimeView.slime.shadowBlur = 0;
        _slimeView.slime.shadowColor = [UIColor clearColor];
        _slimeView.backgroundColor = [UIColor clearColor];
    }
    return _slimeView;
}
@end
