#import "WYZQTaskItemViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import "WYZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import <MapKit/MapKit.h>
#import "WYZQXNLocationManager.h"
#import <DyAdSdk/DyAdApi.h>
@interface WYZQTaskItemViewController ()<updateLocationDelegate>{
    NSMutableArray                  *contentMutArr;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
    NSString                        *cityStr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) WYZQXNLocationManager *locationManager;
@end
@implementation WYZQTaskItemViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    if (self.needCity) {
        [self.locationManager locationStart];
    }else{
        [self requestContent:YES];
    }
}
- (void)dealloc{
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
-(WYZQXNLocationManager*)locationManager{
    if (_locationManager==nil) {
        _locationManager = [[WYZQXNLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    return _locationManager;
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [dic setObject:self.categoryId forKey:@"taskCategoryName"];
    if (cityStr.length > 0) {
        [dic setObject:cityStr forKey:@"city"];
    }
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
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 40) withType:LoadErrorTypeNoData withTip:@"暂无任务"];
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
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 40) withType:LoadErrorTypeNoNetwork withTip:@"网络错误"];
        }else{
            [self showHUDAlert:error];
        }
    }];
}
#pragma mark - UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentMutArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ExamineTwoCell";
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
-(void)updateLocationWithCity:(NSString*)city displayAlert:(BOOL)alert{
    cityStr = city;
    [self requestContent:YES];
}
- (void)updateLocationFailed{
    self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:self.view.frame withType:LoadLocationError withTip:@"无法定位当前位置，请到设置-隐私-定位服务-51赚钱开启定位服务后，点击重新定位" refresh:^(RefreshErrorAlertView * _Nonnull alert) {
        [alert removeFromSuperview];
        [self.locationManager locationStart];
    }];
}
@end
