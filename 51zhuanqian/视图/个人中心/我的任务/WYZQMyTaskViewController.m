#import "WYZQMyTaskViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "SGPagingView.h"
#import "WYZQMyTaskItemViewController.h"
@interface WYZQMyTaskViewController ()<SGPageTitleViewDelegate, SGPageContentViewDelegate>{
}
@property (nonatomic, strong) SGPageTitleView *pageTitleView;
@property (nonatomic, strong) SGPageContentView *pageContentView;
@end
@implementation WYZQMyTaskViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的任务";
    [self addBackBtn];
    [self setupPageView];
    UIButton *btn =  [self addRigthBtn:@"测试"];
    [btn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
}
- (void)test{
    [self.pageTitleView resetTitleWithIndex:0 newTitle:@"审核中(3)"];
}
- (void)setupPageView {
    NSArray *arrayID = [NSArray arrayWithObjects:@"0",@"5",@"3", nil];
    NSArray *arrayTitle = [NSArray arrayWithObjects:@"审核中",@"审核通过",@"审核失败", nil];
    NSMutableArray *viewConMutArr = [NSMutableArray array];
    NSMutableArray *titleMutArr = [NSMutableArray array];
    for (NSInteger i = 0; i < arrayID.count ; i++) {
        WYZQMyTaskItemViewController *viewCon = [[WYZQMyTaskItemViewController alloc] initWithNibName:@"WYZQMyTaskItemViewController" bundle:nil];
        [viewConMutArr addObject:viewCon];
        viewCon.categoryId = [arrayID objectAtIndex:i];
        [titleMutArr addObject:[arrayTitle objectAtIndex:i]];
    }
    CGFloat contentViewHeight = SCREEN_HEIGHT_DEVICE - 104 - IS_iPhoneX_Top;
    self.pageContentView = [[SGPageContentView alloc] initWithFrame:CGRectMake(0, 104 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, contentViewHeight) parentVC:self childVCs:viewConMutArr];
    self.pageContentView.delegatePageContentView = self;
    [self.view addSubview:self.pageContentView];
    self.pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 40) delegate:self titleNames:titleMutArr];
    self.pageTitleView.titleColorStateNormal = TextGrayColor;
    self.pageTitleView.titleColorStateSelected = [UIColor blackColor];
    self.pageTitleView.isShowIndicator = NO;
    self.pageTitleView.isOpenTitleTextZoom = YES;
    [self.view addSubview:self.pageTitleView];
}
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex {
    [self.pageContentView setPageCententViewCurrentIndex:selectedIndex];
}
- (void)pageContentView:(SGPageContentView *)pageContentView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [self.pageTitleView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
}
@end
