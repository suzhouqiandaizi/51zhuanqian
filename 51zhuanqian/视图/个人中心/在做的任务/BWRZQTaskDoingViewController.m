#import "BWRZQTaskDoingViewController.h"
#import "SGPagingView.h"
#import "BWRZQTaskDoingItemViewController.h"
@interface BWRZQTaskDoingViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQTaskDoingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我在做的任务";
    [self addBackBtn];
    [self setupPageView];
}
- (void)test{
    [self.pageTitleView resetTitleWithIndex:0 newTitle:@"审核中(999)"];
}
- (void)setupPageView {
    NSArray *arrayID = [NSMutableArray arrayWithObjects:
                        [NSString stringWithFormat:@"待提交(%@)", [self.taskNumDic objectForKey:@"myOrderReadyToSubmitOrderCount"]],
                        [NSString stringWithFormat:@"待审核(%@)", [self.taskNumDic objectForKey:@"myOrderReadyToApproveCount"]],
                        [NSString stringWithFormat:@"已拒绝(%@)", [self.taskNumDic objectForKey:@"myOrderRejectCount"]],
                        [NSString stringWithFormat:@"已获赏(%@)", [self.taskNumDic objectForKey:@"myOrderGotMoneyCount"]],
                        [NSString stringWithFormat:@"任务失败(%@)", [self.taskNumDic objectForKey:@"myOrderFailedCount"]],
                        nil];
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < arrayID.count ; i++) {
        BWRZQTaskDoingItemViewController *viewCon = [[BWRZQTaskDoingItemViewController alloc] initWithNibName:@"BWRZQTaskDoingItemViewController" bundle:nil];
        viewCon.type = i;
        viewCon.RefreshNum = ^(NSString * _Nonnull num, NSInteger index) {
            [self.pageTitleView resetTitleWithIndex:index newTitle:num];
        };
        [viewConMutArr addObject:viewCon];
        [titleMutArr addObject:[arrayID objectAtIndex:i]];
    }
    CGFloat contentViewHeight = SCREEN_HEIGHT_DEVICE - 114 - IS_iPhoneX_Top;
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 114 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, contentViewHeight) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 40) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextColor;
    self.pageTitleView.titleColorStateSelected = ThemeColor;
    self.pageTitleView.isShowIndicator = NO;
    self.pageTitleView.isShowBottomSeparator = NO;
    self.pageTitleView.indicatorHeight = 4.0f;
    self.pageTitleView.isOpenTitleTextZoom = NO;
    self.pageTitleView.selectedIndex = self.selectedIndex;
    [self.view addSubview:self.pageTitleView];
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.pageTitleView.frame.origin.y + self.pageTitleView.frame.size.height, SCREEN_WIDTH_DEVICE, 10)];
    [lineImageView setBackgroundColor:LineBackgroundColor];
    [self.view addSubview:lineImageView];
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
