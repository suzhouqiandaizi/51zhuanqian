#import "BWRZQTaskVideoPlayerHomeViewController.h"
#import "BWRZQTaskVideoPlayerItemViewController.h"
#import "SGPagingView.h"
@interface BWRZQTaskVideoPlayerHomeViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation BWRZQTaskVideoPlayerHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
    [[ServiceRequest sharedService] GET:@"video-task/category" parameters:nil success:^(id responseObject) {
        [self setupPageView:responseObject];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"video-task/category"];
}
- (void)setupPageView:(NSArray *)arr {
    NSArray *contentArr = arr;
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < contentArr.count ; i++) {
        BWRZQTaskVideoPlayerItemViewController *viewCon = [[BWRZQTaskVideoPlayerItemViewController alloc] initWithNibName:@"BWRZQTaskVideoPlayerItemViewController" bundle:nil];
        [viewConMutArr addObject:viewCon];
        viewCon.categoryId = [[contentArr objectAtIndex:i] objectForKey:@"categoryName"];
        [titleMutArr addObject:[[contentArr objectAtIndex:i] objectForKey:@"categoryDescription"]];
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
