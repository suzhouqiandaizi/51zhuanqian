#import "WYZQFriendDetailViewController.h"
#import "WYZQHomeTableViewCell.h"
#import "WYZQFriendDetailHeaderView.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQTaskReadViewController.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>
@interface WYZQFriendDetailViewController ()<UINavigationControllerDelegate>{
    WYZQFriendDetailHeaderView *headerView;
    BOOL                   personInfoloaded;
    BOOL                   taskInfoloaded;
    NSInteger              pageNum;
    NSInteger              pageSize;
    NSMutableArray         *contentMutArr;
}
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQFriendDetailViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    self.navigationController.delegate = self;
    [self addBackBtn];
    [self.bgImageView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 123 + IS_iPhoneX_Top)];
    self.topView.hidden = YES;
    [self.topView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 64 + IS_iPhoneX_Top)];
    headerView = [[WYZQFriendDetailHeaderView alloc] initItem];
    __block WYZQFriendDetailViewController *viewCon = self;
    headerView.RefreshHandle = ^{
        if (viewCon.RefreshHandle) {
            viewCon.RefreshHandle();
        }
    };
    self.tableView.tableHeaderView = headerView;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, IS_iPhoneX_Bottom, 0);
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.tableView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
    self.tableView.hidden = YES;
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    personInfoloaded = NO;
    taskInfoloaded = NO;
    UserInfo *user = [UserManger currentLoggedInUser];
    if ([user.userID isEqualToString:self.userId]) {
        headerView.guanzhuBtn.hidden = YES;
    }else{
        headerView.guanzhuBtn.hidden = NO;
    }
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/task-user-info", self.userId] parameters:nil success:^(id responseObject) {
        self->personInfoloaded = YES;
        [self->headerView showContent:responseObject];
        [self loadedAllContent];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
    [self requestContent:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self){
        self.navigationController.delegate = nil;
    }
}
- (void)dealloc {
    self.navigationController.delegate = nil;
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/task-user-info", self.userId]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task"];
}
- (void)refreshHeader{
    pageNum = 1;
    [self requestContent:NO];
}
- (void)refreshFooter{
    pageNum = ++pageNum;
    [self requestContent:NO];
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.userId forKey:@"publisherPlatformId"];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [[ServiceRequest sharedService] GET:@"task" parameters:dic success:^(id responseObject) {
        self->taskInfoloaded = YES;
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr  removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"taskListDetails"];
        for (int i = 0; i < arr.count; i++) {
            [self->contentMutArr addObject:[WYZQTaskObject taskItemDic:[arr objectAtIndex:i]]];
        }
        if (self->contentMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - self.tableView.tableHeaderView.frame.size.height) withType:LoadErrorTypeNoData withTip:@"暂无发布的任务"];
        }else{
            self.tableView.tableFooterView = nil;
        }
        if (arr.count < self->pageSize) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
        [self loadedAllContent];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
- (void)loadedAllContent{
    if (personInfoloaded && taskInfoloaded) {
        [self hideHudAlert];
        self.tableView.hidden = NO;
    }
}
- (IBAction)backExPress {
    [self goBackAction];
}
#pragma mark - UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return contentMutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HomeCell";
    WYZQHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQHomeTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    WYZQTaskObject *task = [contentMutArr objectAtIndex:indexPath.row];
    [cell showContent:task];
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    WYZQTaskObject *task = [contentMutArr objectAtIndex:indexPath.row];
    if ([task.taskType isEqualToString:@"READ"]) {
        WYZQTaskReadViewController *viewCon = [[WYZQTaskReadViewController alloc] initWithNibName:@"WYZQTaskReadViewController" bundle:nil];
        viewCon.taskId = task.taskId;
        [self.navigationController pushViewController:viewCon animated:YES];
    }else if ([task.taskType isEqualToString:@"VIDEO"]){
        WYZQTaskVideoPlayerViewController *viewCon = [[WYZQTaskVideoPlayerViewController alloc] initWithNibName:@"WYZQTaskVideoPlayerViewController" bundle:nil];
        viewCon.taskId = task.taskId;
        [self.navigationController pushViewController:viewCon animated:YES];
    }else if ([task.taskType isEqualToString:@"91TAOJIN"]){
        [TJSDK presentViewController:self withCplKey:task.thirdpartyKeyStr];
    }else if ([task.taskType isEqualToString:@"DUOYOU"]){
        UserInfo *user = [UserManger currentLoggedInUser];
        [DyAdApi presentDetailViewController:self userId:user.userID advertId:task.thirdpartyKeyStr];
    }
    else{
        WYZQTaskDetailTwoViewController *viewCon = [[WYZQTaskDetailTwoViewController alloc] initWithNibName:@"WYZQTaskDetailTwoViewController" bundle:nil];
        viewCon.taskId = task.taskId;
        [self.navigationController pushViewController:viewCon animated:YES];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = scrollView.contentOffset.y;
    if (yOffset > 0) {
        self.topView.hidden = NO;
    }else{
        self.topView.hidden = YES;
    }
    if (yOffset < 0) {
        CGFloat factor = ((ABS(yOffset)+(123 + IS_iPhoneX_Top ))*SCREEN_WIDTH_DEVICE)/(123 + IS_iPhoneX_Top);
        CGRect f = CGRectMake((SCREEN_WIDTH_DEVICE - factor)/2.0, 0, factor, (123 + IS_iPhoneX_Top)+ABS(yOffset));
        self.bgImageView.frame = f;
    } else {
        if (yOffset < (123 + IS_iPhoneX_Top)) {
            if (yOffset == 0) {
                [self.bgImageView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 123 + IS_iPhoneX_Top)];
            }else{
                CGRect f = self.bgImageView.frame;
                f.origin.y = -yOffset;
                self.bgImageView.frame = f;
            }
        }
    }
}
@end
