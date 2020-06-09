#import "BWRZQTaskDoingItemViewController.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskDoingDetailViewController.h"
#import "BWRZQSubmitTaskViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
@interface BWRZQTaskDoingItemViewController (){
    NSMutableArray                  *contentMutArr;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation BWRZQTaskDoingItemViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task-order"];
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
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [dic setObject:[self getStatusStr:self.type] forKey:@"taskOrderStatus"];
    [[ServiceRequest sharedService] GET:@"task-order" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            if (self.RefreshNum) {
                self.RefreshNum([NSString stringWithFormat:@"%@(%@)",[self getStatusStr:self.type] ,[responseObject objectForKey:@"count"]], self.type);
            }
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"userTaskOrderListDtos"];
        [self->contentMutArr addObjectsFromArray:arr];
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
    return contentMutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TaskDoingItemCell";
    BWRZQTaskDoingItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQTaskDoingItemTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell showContent:self.type withContentDic:[contentMutArr objectAtIndex:indexPath.row] witdIndex:indexPath.row];
    cell.chakan = ^(NSInteger index) {
        BWRZQTaskDoingDetailViewController *viewCon = [[BWRZQTaskDoingDetailViewController alloc] initWithNibName:@"BWRZQTaskDoingDetailViewController" bundle:nil];
        NSDictionary *dic = [self->contentMutArr objectAtIndex:index];
        viewCon.taskId = [dic objectForKey:@"taskNo"];
        viewCon.orderId = [dic objectForKey:@"orderNo"];
        viewCon.type = self.type;
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.tijiaorenwu = ^(NSInteger index) {
        BWRZQSubmitTaskViewController *viewCon = [[BWRZQSubmitTaskViewController alloc] initWithNibName:@"BWRZQSubmitTaskViewController" bundle:nil];
        NSDictionary *dic = [self->contentMutArr objectAtIndex:index];
        viewCon.taskId = [dic objectForKey:@"taskNo"];
        viewCon.orderId = [dic objectForKey:@"orderNo"];
        viewCon.RefreshHandle = ^{
            [self refreshHeader];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.fangqirenwu = ^(NSInteger index) {
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"是否要放弃当前任务？" withTitle:@"提示"]];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"放弃", nil]];
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
            if (buttonIndex == 0) {
            }else{
                NSDictionary *dic = [self->contentMutArr objectAtIndex:index];
                [self loadingHUDAlert:@"请稍候"];
                [[ServiceRequest sharedService] PUT:[NSString stringWithFormat:@"task-order/%@/abandon", [dic objectForKey:@"orderNo"]] parameters:nil success:^(id responseObject) {
                    [self hideHudAlert];
                    [self refreshHeader];
                } failure:^(NSString *error, NSInteger code) {
                    [self hideHudAlert];
                    [self showHUDAlert:error];
                }];
            }
        }];
        [alertView setUseMotionEffects:true];
        [self.view endEditing:YES];
        [alertView show];
    };
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    BWRZQTaskDoingDetailViewController *viewCon = [[BWRZQTaskDoingDetailViewController alloc] initWithNibName:@"BWRZQTaskDoingDetailViewController" bundle:nil];
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    viewCon.taskId = [dic objectForKey:@"taskNo"];
    viewCon.orderId = [dic objectForKey:@"orderNo"];
    viewCon.type = self.type;
    viewCon.RefreshHandle = ^{
        [self refreshHeader];
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (NSString *)getStatusStr:(TaskDoingType)type{
    switch (type) {
        case TaskDoingType_daitijiao:
            return @"待提交";
            break;
        case TaskDoingType_daitishenhe:
            return @"待审核";
            break;
        case TaskDoingType_weitongguo:
            return @"已拒绝";
            break;
        case TaskDoingType_yihuoshang:
            return @"已获赏";
            break;
        case TaskDoingType_renwushibai:
            return @"任务失败";
            break;
        default:
            break;
    }
}
@end
