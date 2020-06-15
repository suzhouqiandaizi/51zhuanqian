#import "WYZQHomeViewController.h"
#import "TabBarView.h"
#import "WYZQHomeHeaderView.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQFaBuChooseTypeViewController.h"
#import "RefreshErrorAlertView.h"
#import "UIAlertView+Blocks.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import "WYZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>
#import "WYZQFaBuPayViewController.h"
#import "UpdateAlertView.h"
#import "WYZQBaiduTaskReadViewController.h"
@interface WYZQHomeViewController (){
    TabBarView                 *tabBarView;
    WYZQHomeHeaderView             *headerView;
    NSInteger                  pageNum;
    NSInteger                  pageSize;
    NSMutableArray             *contentMutArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    tabBarView = [TabBarView sharedTabBarView];
    [self.navigationItem setHidesBackButton:YES];
    headerView = [[WYZQHomeHeaderView alloc] initItem];
    __block WYZQHomeViewController *viewCon = self;
    headerView.thirdpartyKeyHandle = ^(NSString * _Nonnull key) {
        if ([key isEqualToString:@"91TAOJIN"]) {
            [TJSDK presentViewController:viewCon];
        }else if ([key isEqualToString:@"DUOYOU"]){
            UserInfo *user = [UserManger currentLoggedInUser];
            [DyAdApi presentListViewController:viewCon userId:user.userID advertType:0];
        }
    };
    self.tableView.tableHeaderView = headerView;
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    [self requestContent:YES];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self.tableView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - IS_iPhoneX_Bottom - 64 - 50)];
    UIButton *sureBtn = [self addRigthBtn:@"发布任务" withButtonColor:ThemeColor];
    [sureBtn addTarget:self action:@selector(fabuPress) forControlEvents:UIControlEventTouchUpInside];
    [self updateVersion];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.fd_interactivePopDisabled = YES;
    [self.view addSubview:tabBarView];
    [tabBarView setCurrentViewControllerIndex:1];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.fd_interactivePopDisabled = NO;
}
- (void)refreshHeader{
    pageNum = 1;
    [self requestContent:NO];
}
- (void)refreshFooter{
    pageNum = ++pageNum;
    [self requestContent:NO];
}
- (void)refreshViewCon{
    pageNum = 1;
    [self requestContent:NO];
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [dic setObject:[NSNumber numberWithBool:YES] forKey:@"recommended"];
    [[ServiceRequest sharedService] GET:@"task" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"taskListDetails"];
        for (int i = 0; i < arr.count; i++) {
            [self->contentMutArr addObject:[WYZQTaskObject taskItemDic:[arr objectAtIndex:i]]];
        }
        if (self->contentMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 300) withType:LoadErrorTypeNoData withTip:@"暂无任务"];
        }else{
            self.tableView.tableFooterView = nil;
        }
        if (arr.count < self->pageSize) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        if (code == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 300) withType:LoadErrorTypeNoNetwork withTip:@"网络错误"];
        }else{
            [self showHUDAlert:error];
        }
    }];
    if (alert) {
        [[ServiceRequest sharedService] GET:@"banner" parameters:nil success:^(id responseObject) {
            [self->headerView setBanners:responseObject];
        } failure:^(NSString *error, NSInteger code) {
        }];
    }
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
- (void)fabuPress{
    WYZQFaBuChooseTypeViewController *viewCon = [[WYZQFaBuChooseTypeViewController alloc] initWithNibName:@"WYZQFaBuChooseTypeViewController" bundle:nil];    
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)updateVersion{
    [[ServiceRequest sharedService] GET:@"configuration/config-data" parameters:@{@"dataUrl":[NSString stringWithFormat:@"%@%@", HOSTURL, @"/app_51zhuanqian/ios.json"]} success:^(NSDictionary *responseObject) {
        NSString *version = [responseObject objectForKey:@"version"];
        if (![version isEqualToString:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]] && [[responseObject objectForKey:@"examine"] isEqualToString:@"NO"]) {
            UpdateAlertView *alertView = [[UpdateAlertView alloc] initItem:responseObject];
            [self.view.window addSubview:alertView];
        }
    } failure:^(NSString *error, NSInteger code) {
    }];
}
@end
