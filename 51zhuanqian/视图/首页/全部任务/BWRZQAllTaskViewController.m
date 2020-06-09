#import "BWRZQAllTaskViewController.h"
#import "SGPagingView.h"
#import "BWRZQTaskItemViewController.h"
#import "LoadConfig.h"
@interface BWRZQAllTaskViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>{
}
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQAllTaskViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务";
    [self addBackBtn];
    [self setupPageView];
}
- (void)setupPageView {
    NSDictionary *configDic = [[[LoadConfig shareStance] getTaskHomeCategory] firstObject];
    NSArray *contentArr = [configDic objectForKey:@"componentDtos"];
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < contentArr.count ; i++) {
        BWRZQTaskItemViewController *viewCon = [[BWRZQTaskItemViewController alloc] initWithNibName:@"BWRZQTaskItemViewController" bundle:nil];
        [viewConMutArr addObject:viewCon];
        viewCon.categoryId = [[contentArr objectAtIndex:i] objectForKey:@"title"];
        viewCon.needCity = [[[contentArr objectAtIndex:i] objectForKey:@"needCity"] boolValue];
        [titleMutArr addObject:[[contentArr objectAtIndex:i] objectForKey:@"title"]];
    }
    CGFloat contentViewHeight = SCREEN_HEIGHT_DEVICE - 104 - IS_iPhoneX_Top;
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 104 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, contentViewHeight) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 40) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextGrayColor;
    self.pageTitleView.titleColorStateSelected = [UIColor blackColor];
    self.pageTitleView.isShowIndicator = YES;
    self.pageTitleView.isShowBottomSeparator = NO;
    self.pageTitleView.indicatorHeight = 4.0f;
    self.pageTitleView.isOpenTitleTextZoom = YES;
    self.pageTitleView.indicatorLengthStyle = SGIndicatorLengthTypeCustom;
    self.pageTitleView.selectedIndex = self.selectedNum;
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
