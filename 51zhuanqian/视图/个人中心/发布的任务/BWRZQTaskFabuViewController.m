#import "BWRZQTaskFabuViewController.h"
#import "SGPagingView.h"
#import "BWRZQTaskFabuItemViewController.h"
@interface BWRZQTaskFabuViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQTaskFabuViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我发布的任务";
    [self addBackBtn];
    [self setupPageView];
}
- (void)setupPageView {
    NSArray *arrayID = [NSMutableArray arrayWithObjects:
                        [NSString stringWithFormat:@"待审核(%@)", [self.taskNumDic objectForKey:@"taskReadyToSubmitOrderCount"]],
                        [NSString stringWithFormat:@"待付款(%@)", [self.taskNumDic objectForKey:@"taskReadyToPayCount"]],
                        [NSString stringWithFormat:@"进行中(%@)", [self.taskNumDic objectForKey:@"taskInprocessCount"]],
                        [NSString stringWithFormat:@"等待结束(%@)", [self.taskNumDic objectForKey:@"taskWaitToEndCount"]],
                        [NSString stringWithFormat:@"已结束(%@)", [self.taskNumDic objectForKey:@"taskCompleteCount"]],
                        [NSString stringWithFormat:@"审核失败(%@)", [self.taskNumDic objectForKey:@"taskRejectCount"]], nil];
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < arrayID.count ; i++) {
        BWRZQTaskFabuItemViewController *viewCon = [[BWRZQTaskFabuItemViewController alloc] initWithNibName:@"BWRZQTaskFabuItemViewController" bundle:nil];
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
    self.selectedIndex = selectedIndex;
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}
- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    self.selectedIndex = targetIndex;
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
- (void)endDeceleratingPageContentView:(SGPageContentView *)pageContentView targetIndex:(NSInteger)targetIndex{
    self.selectedIndex = targetIndex;
    [self.pageTitleView setPageEndDeceleratingwithTargetIndex:targetIndex];
}
@end
