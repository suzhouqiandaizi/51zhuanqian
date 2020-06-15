#import "WYZQAttentionFunsViewController.h"
#import "SGPagingView.h"
#import "WYZQAttentionFunsDetailViewController.h"
@interface WYZQAttentionFunsViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation WYZQAttentionFunsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
    [self setupPageView];
}
- (void)setupPageView {
    NSArray *arrayID = [NSMutableArray arrayWithObjects:@"关注",@"粉丝", nil];
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < arrayID.count ; i++) {
        WYZQAttentionFunsDetailViewController *viewCon = [[WYZQAttentionFunsDetailViewController alloc] initWithNibName:@"WYZQAttentionFunsDetailViewController" bundle:nil];
        viewCon.selectedIndex = i;
        [viewConMutArr addObject:viewCon];
        [titleMutArr addObject:[arrayID objectAtIndex:i]];
    }
    CGFloat contentViewHeight = SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top;
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, contentViewHeight) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 0, 250, 40) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextColor;
    self.pageTitleView.titleColorStateSelected = ThemeColor;
    self.pageTitleView.isShowIndicator = NO;
    self.pageTitleView.isShowBottomSeparator = NO;
    self.pageTitleView.indicatorHeight = 4.0f;
    self.pageTitleView.isOpenTitleTextZoom = NO;
    self.pageTitleView.selectedIndex = self.selectedIndex;
    [self.pageTitleView setBackgroundColor:[UIColor clearColor]];
    self.navigationItem.titleView = self.pageTitleView;
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
