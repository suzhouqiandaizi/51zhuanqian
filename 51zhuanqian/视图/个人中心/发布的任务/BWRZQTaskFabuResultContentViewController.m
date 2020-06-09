#import "BWRZQTaskFabuResultContentViewController.h"
#import "SGPagingView.h"
#import "BWRZQTaskFabuResultViewController.h"
@interface BWRZQTaskFabuResultContentViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQTaskFabuResultContentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPageView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/published/%@/order-statics", self.taskId] parameters:nil success:^(id responseObject) {
         [self.pageTitleView resetTitleWithIndex:0 newTitle:[NSString stringWithFormat:@"待审核(%@)", [responseObject objectForKey:@"readyToApproveCount"]]];
        [self.pageTitleView resetTitleWithIndex:1 newTitle:[NSString stringWithFormat:@"已通过(%@)", [responseObject objectForKey:@"approvedCount"]]];
        [self.pageTitleView resetTitleWithIndex:2 newTitle:[NSString stringWithFormat:@"已拒绝(%@)", [responseObject objectForKey:@"rejectCount"]]];
    } failure:^(NSString *error, NSInteger code) {
    }];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/published/%@/order-statics", self.taskId]];
}
- (void)setupPageView {
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [[NSMutableArray alloc] initWithObjects:@"待审核(0)",@"已通过(0)",@"已拒绝(0)", nil];
    CGFloat contentViewHeight = self.viewHeight - 35;
    for (NSInteger i = 0; i < 3 ; i++) {
        BWRZQTaskFabuResultViewController *viewCon = [[BWRZQTaskFabuResultViewController alloc] initWithNibName:@"BWRZQTaskFabuResultViewController" bundle:nil];
        viewCon.viewHeight = contentViewHeight;
        viewCon.type = i;
        viewCon.taskId = self.taskId;
        viewCon.RefreshNum = ^(NSString * _Nonnull num, NSInteger index) {
            [self.pageTitleView resetTitleWithIndex:index newTitle:num];
        };
        [viewConMutArr addObject:viewCon];
    }
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH_DEVICE, contentViewHeight) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 35) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextGrayColor;
    self.pageTitleView.titleColorStateSelected = ThemeColor;
    self.pageTitleView.isShowIndicator = NO;
    self.pageTitleView.isShowBottomSeparator = YES;
    self.pageTitleView.indicatorHeight = 4.0f;
    self.pageTitleView.isOpenTitleTextZoom = NO;
    [self.view addSubview:self.pageTitleView];
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
