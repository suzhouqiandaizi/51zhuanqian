#import "BWRZQTaskFabuDetailViewController.h"
#import "GlobalFunction.h"
#import "BWRZQFaBuDetailTwoViewController.h"
#import "BWRZQTaskFabuDetailProcessViewController.h"
#import "SGPagingView.h"
#import "BWRZQFaBuFillInViewController.h"
#import "BWRZQTaskFabuResultContentViewController.h"
#import "BWRZQFaBuPayViewController.h"
#import "BWRZQFaBuFillInTwoViewController.h"
@interface BWRZQTaskFabuDetailViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *danjiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *zongjiaLabel;
@property (weak, nonatomic) IBOutlet UILabel *shengyumingeLabel;
@property (weak, nonatomic) IBOutlet UILabel *liulangliangLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *chakanOneBtn;
@property (weak, nonatomic) IBOutlet UIButton *chakanTwoBtn;
@property (weak, nonatomic) IBOutlet UIButton *xiugaiBtn;
@property (weak, nonatomic) IBOutlet UIButton *fukuanBtn;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQTaskFabuDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我发布的任务";
    [self addBackBtn];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.topView.frame.size.height)];
    [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 44, SCREEN_WIDTH_DEVICE, 44)];
    [self.contentView setFrame:CGRectMake(0, self.topView.frame.size.height + self.topView.frame.origin.y, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - (self.topView.frame.size.height + self.topView.frame.origin.y) - self.bottomView.frame.size.height - IS_iPhoneX_Bottom)];
    [self.chakanOneBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    [self.xiugaiBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    [self.fukuanBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    [self requestConent];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/published/%@/process-result", self.taskId]];
}
- (void)requestConent{
    self.topView.hidden = YES;
    self.bottomView.hidden = YES;
    [self loadingHUDAlert:@"正在加载"];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/published/%@/process-result", self.taskId] parameters:nil success:^(id responseObject) {
        self.topView.hidden = NO;
        self.bottomView.hidden = NO;
        [self hideHudAlert];
        NSString *statusStr = [responseObject objectForKey:@"taskStatus"];
        CGSize labelSize = [statusStr boundingRectWithSize:CGSizeMake(150, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0]} context:nil].size;
        self.statusLabel.text = statusStr;
        self.statusLabel.layer.masksToBounds = YES;
        self.statusLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.statusLabel.layer.borderWidth = 0.5f;
        self.statusLabel.layer.cornerRadius = 3.0f;
        [self.statusLabel setFrame:CGRectMake(15, self.statusLabel.frame.origin.y, labelSize.width + 8, 20)];
        self.titleLabel.text = [responseObject objectForKey:@"taskTitle"];
        [self.titleLabel setFrame:CGRectMake(self.statusLabel.frame.origin.x + self.statusLabel.frame.size.width + 8, self.titleLabel.frame.origin.y, SCREEN_WIDTH_DEVICE - (self.statusLabel.frame.origin.x + self.statusLabel.frame.size.width + 18), self.statusLabel.frame.size.height)];
        self.danjiaLabel.text = [NSString stringWithFormat:@"任务单价：%@", [responseObject objectForKey:@"rewardAmountDisplay"]];
        self.zongjiaLabel.text = [NSString stringWithFormat:@"任务总价：%@", [responseObject objectForKey:@"taskAllRewardAmountDisplay"]];
        self.shengyumingeLabel.text = [NSString stringWithFormat:@"剩余名额：%@", [responseObject objectForKey:@"leftBidTimeDisplay"]];
        if ([statusStr isEqualToString:@"待审核"] || [statusStr isEqualToString:@"待付款"] || [statusStr isEqualToString:@"审核失败"]){
            self.liulangliangLabel.hidden = YES;
            BWRZQTaskFabuDetailProcessViewController *viewCon = [[BWRZQTaskFabuDetailProcessViewController alloc] initWithNibName:@"BWRZQTaskFabuDetailProcessViewController" bundle:nil];
            viewCon.contentArr = [responseObject objectForKey:@"historySteps"];
            [self addChildViewController:viewCon];
            [viewCon.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
            [self.contentView addSubview:viewCon.view];
        }else{
            self.liulangliangLabel.hidden = NO;
            self.liulangliangLabel.text = [NSString stringWithFormat:@"浏览量：%@", [responseObject objectForKey:@"viewCount"]];
            [self setupPageView:responseObject];
        }
        if ([statusStr isEqualToString:@"审核失败"]) {
            self.chakanOneBtn.hidden = YES;
            self.chakanTwoBtn.hidden = NO;
            self.xiugaiBtn.hidden = NO;
            self.fukuanBtn.hidden = YES;
        }else if ([statusStr isEqualToString:@"待付款"]){
            self.chakanOneBtn.hidden = YES;
            self.chakanTwoBtn.hidden = NO;
            self.xiugaiBtn.hidden = YES;
            self.fukuanBtn.hidden = NO;
        }else{
            self.chakanOneBtn.hidden = NO;
            self.chakanTwoBtn.hidden = YES;
            self.xiugaiBtn.hidden = YES;
            self.fukuanBtn.hidden = YES;
        }
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (IBAction)chakanPress {
    BWRZQFaBuDetailTwoViewController *viewCon = [[BWRZQFaBuDetailTwoViewController alloc] initWithNibName:@"BWRZQFaBuDetailTwoViewController" bundle:nil];
    viewCon.taskId = self.taskId;
    viewCon.taskCategoryStr = self.taskCategoryStr;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)xiugaiPress {
    BWRZQFaBuFillInTwoViewController *viewCon = [[BWRZQFaBuFillInTwoViewController alloc] initWithNibName:@"BWRZQFaBuFillInTwoViewController" bundle:nil];
    viewCon.taskId = self.taskId;
    viewCon.taskCategoryStr = self.taskCategoryStr;
    viewCon.RefreshHandle = ^{
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self requestConent];
        if (self.RefreshHandle) {
            self.RefreshHandle();
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)fukuanPress {
    BWRZQFaBuPayViewController *viewCon = [[BWRZQFaBuPayViewController alloc] initWithNibName:@"BWRZQFaBuPayViewController" bundle:nil];
    viewCon.taskId = self.taskId;
    viewCon.amountStr = [self.zongjiaLabel.text stringByReplacingOccurrencesOfString:@"任务总价：" withString:@""];
    viewCon.RefreshHandle = ^{
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self requestConent];
        if (self.RefreshHandle) {
            self.RefreshHandle();
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)setupPageView:(NSDictionary *)responseObject {
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    BWRZQTaskFabuDetailProcessViewController *viewCon1 = [[BWRZQTaskFabuDetailProcessViewController alloc] initWithNibName:@"BWRZQTaskFabuDetailProcessViewController" bundle:nil];
    viewCon1.contentArr = [responseObject objectForKey:@"historySteps"];
    [viewConMutArr addObject:viewCon1];
    [titleMutArr addObject:@"任务进程"];
    BWRZQTaskFabuResultContentViewController *viewCon2 = [[BWRZQTaskFabuResultContentViewController alloc] initWithNibName:@"BWRZQTaskFabuResultContentViewController" bundle:nil];
    [viewConMutArr addObject:viewCon2];
    viewCon2.taskId = self.taskId;
    viewCon2.viewHeight = self.contentView.frame.size.height - 40;
    [titleMutArr addObject:[NSString stringWithFormat:@"任务提交结果(%@)", [responseObject objectForKey:@"submitCount"]]];
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
    self.pageTitleView.selectedIndex = self.pageNum;
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
