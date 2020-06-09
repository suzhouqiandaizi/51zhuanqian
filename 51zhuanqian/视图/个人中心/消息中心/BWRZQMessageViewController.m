#import "BWRZQMessageViewController.h"
#import "SGPagingView.h"
#import "BWRZQMessageItemViewController.h"
@interface BWRZQMessageViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>{
}
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQMessageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    [self addBackBtn];
   [self setupPageView];
}
- (void)setupPageView {
    NSArray *arrayID = [NSMutableArray arrayWithObjects:
                        @"任务消息",
                        @"系统消息", nil];
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < arrayID.count ; i++) {
        BWRZQMessageItemViewController *viewCon = [[BWRZQMessageItemViewController alloc] initWithNibName:@"BWRZQMessageItemViewController" bundle:nil];
        viewCon.type = i;
        viewCon.taskNumDic = self.taskNumDic;
        [viewConMutArr addObject:viewCon];
        [titleMutArr addObject:[arrayID objectAtIndex:i]];
    }
    CGFloat contentViewHeight = SCREEN_HEIGHT_DEVICE - 104 - IS_iPhoneX_Top;
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 104 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, contentViewHeight) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 40) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextColor;
    self.pageTitleView.titleColorStateSelected = ThemeColor;
    self.pageTitleView.isShowIndicator = NO;
    self.pageTitleView.isShowBottomSeparator = NO;
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
