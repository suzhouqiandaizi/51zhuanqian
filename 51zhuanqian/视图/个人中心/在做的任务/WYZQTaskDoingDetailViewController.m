#import "WYZQTaskDoingDetailViewController.h"
#import "WYZQTaskObject.h"
#import "GlobalFunction.h"
#import "SGPagingView.h"
#import "WYZQTaskDoingDetailTwoContentViewController.h"
#import "WYZQTaskDoingDetailProcessViewController.h"
#import "WYZQTaskButton.h"
#import "WYZQSubmitTaskViewController.h"
#import "WYZQAppealViewController.h"
@interface WYZQTaskDoingDetailViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>{
    WYZQTaskObject *taskObject;
    WYZQTaskDoingDetailTwoContentViewController *viewCon1;
}
@property (weak, nonatomic) IBOutlet UIView *infoBottomView;
@property (weak, nonatomic) IBOutlet WYZQTaskButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *surplusLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation WYZQTaskDoingDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务详情";
    [self addBackBtn];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.topView.frame.size.height)];
    [self.sureBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    if (self.type == TaskDoingType_weitongguo) {
        self.infoBottomView.hidden = NO;
        [self.infoBottomView setFrame:CGRectMake(0, self.sureBtn.frame.origin.y - self.infoBottomView.frame.size.height, SCREEN_WIDTH_DEVICE, self.infoBottomView.frame.size.height)];
        [self.contentView setFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - self.topView.frame.origin.y - self.topView.frame.size.height - IS_iPhoneX_Bottom - 44 - self.infoBottomView.frame.size.height)];
    }else{
        self.infoBottomView.hidden = YES;
        [self.contentView setFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - self.topView.frame.origin.y - self.topView.frame.size.height - IS_iPhoneX_Bottom - 44)];
    }
    self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 3, 0, [UIColor whiteColor], [UIColor whiteColor], 13.0);
    [self setupPageView];
    [self requestContent];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task-order/%@", self.orderId]];
}
- (IBAction)shensuPress {
    WYZQAppealViewController *viewCon = [[WYZQAppealViewController alloc] initWithNibName:@"WYZQAppealViewController" bundle:nil];
    viewCon.orderId = self.orderId;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)surePress {
    WYZQSubmitTaskViewController *viewCon = [[WYZQSubmitTaskViewController alloc] initWithNibName:@"WYZQSubmitTaskViewController" bundle:nil];
    viewCon.taskId = self.taskId;
    viewCon.orderId = self.orderId;
    viewCon.RefreshHandle = ^{
        [self requestContent];
        if (self.RefreshHandle) {
            self.RefreshHandle();
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)requestContent{
    [self loadingHUDAlert:@"正在加载"];
    self.topView.hidden = YES;
    self.sureBtn.hidden = YES;
    self.contentView.hidden = YES;
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task-order/%@", self.orderId] parameters:nil success:^(id responseObject) {
        [self hideHudAlert];
        self.topView.hidden = NO;
        self.sureBtn.hidden = NO;
        self.contentView.hidden = NO;
        NSDictionary *contentDic = responseObject;
        [self.sureBtn setTaskDoingButtonTitle:[contentDic objectForKey:@"statusLabel"] withStatus:[contentDic objectForKey:@"taskStatus"]];
        WYZQTaskObject *task = [WYZQTaskObject taskDetailDic:contentDic];
        self->taskObject = task;
        self.titleLabel.text = task.title;
        self.taskTimeLabel.text = [NSString stringWithFormat:@"任务时间：%@", task.bidSubmitDurationHours];
        self.surplusLabel.text = [NSString stringWithFormat:@"剩余%@份 · %@", task.leftBidTime, task.endTimeDisplay];
        self.priceLabel.text = task.rewardAmountDisplay;
        if (self.priceLabel.text.length > 0) {
            self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 3, 0, [UIColor whiteColor], [UIColor whiteColor], 13.0);
        }
        [self->viewCon1 showContent:task];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)setupPageView{
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    viewCon1 = [[WYZQTaskDoingDetailTwoContentViewController alloc] initWithNibName:@"WYZQTaskDoingDetailTwoContentViewController" bundle:nil];
    [viewConMutArr addObject:viewCon1];
    [titleMutArr addObject:@"任务详情"];
    WYZQTaskDoingDetailProcessViewController *viewCon2 = [[WYZQTaskDoingDetailProcessViewController alloc] initWithNibName:@"WYZQTaskDoingDetailProcessViewController" bundle:nil];
    viewCon2.orderId = self.orderId;
    viewCon2.taskId = self.taskId;
    [viewConMutArr addObject:viewCon2];
    [titleMutArr addObject:@"任务进程"];
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height - 40) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.contentView addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 40) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextColor;
    self.pageTitleView.titleColorStateSelected = ThemeColor;
    self.pageTitleView.isShowIndicator = NO;
    self.pageTitleView.isShowBottomSeparator = YES;
    self.pageTitleView.indicatorHeight = 4.0f;
    self.pageTitleView.isOpenTitleTextZoom = NO;
    self.pageTitleView.indicatorLengthStyle = SGIndicatorLengthTypeCustom;
    [self.contentView addSubview:self.pageTitleView];
}
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}
- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
- (void)endDeceleratingPageContentView:(SGPageContentView *)pageContentView targetIndex:(NSInteger)targetIndex{
    [self.pageTitleView setPageEndDeceleratingwithTargetIndex:targetIndex];
}
@end
