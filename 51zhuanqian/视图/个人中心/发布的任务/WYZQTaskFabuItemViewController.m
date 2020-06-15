#import "WYZQTaskFabuItemViewController.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "WYZQFaBuPayViewController.h"
#import "WYZQFaBuDetailTwoViewController.h"
#import "WYZQTaskFabuDetailViewController.h"
#import "WYZQFaBuFillInViewController.h"
#import "WYZQFaBuFillInTwoViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
@interface WYZQTaskFabuItemViewController (){
    NSMutableArray                  *contentMutArr;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQTaskFabuItemViewController
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
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"task/user/published"];
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
    [dic setObject:[self getStatusStr:self.type] forKey:@"taskStatus"];
    [[ServiceRequest sharedService] GET:@"task/user/published" parameters:dic success:^(id responseObject) {
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
        NSArray *arr = [responseObject objectForKey:@"taskPublishListDetails"];
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
    return [contentMutArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TaskFabuItemCell";
    WYZQTaskFabuItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQTaskFabuItemTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell showContent:self.type withContentDic:[contentMutArr objectAtIndex:indexPath.row] witdIndex:indexPath.row];
    cell.chakan = ^(NSInteger index) {
        WYZQFaBuDetailTwoViewController *viewCon = [[WYZQFaBuDetailTwoViewController alloc] initWithNibName:@"WYZQFaBuDetailTwoViewController" bundle:nil];
        viewCon.taskId = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"];
        viewCon.taskCategoryStr = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskCategory"];
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.chakanResult = ^(NSInteger index) {
        WYZQTaskFabuDetailViewController *viewCon = [[WYZQTaskFabuDetailViewController alloc] initWithNibName:@"WYZQTaskFabuDetailViewController" bundle:nil];
        viewCon.taskId = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"];
        viewCon.taskCategoryStr = [[self->contentMutArr objectAtIndex:indexPath.row] objectForKey:@"taskCategory"];
        viewCon.pageNum = 1;
        viewCon.RefreshHandle = ^{
            [self refreshHeader];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.fukuan = ^(NSInteger index) {
        WYZQFaBuPayViewController *viewCon = [[WYZQFaBuPayViewController alloc] initWithNibName:@"WYZQFaBuPayViewController" bundle:nil];
        viewCon.taskId = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"];
        viewCon.amountStr = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskAllRewardAmountDisplay"];
        viewCon.RefreshHandle = ^{
            [self refreshHeader];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.xiugairenwu = ^(NSInteger index) {
        WYZQFaBuFillInTwoViewController *viewCon = [[WYZQFaBuFillInTwoViewController alloc] initWithNibName:@"WYZQFaBuFillInTwoViewController" bundle:nil];
        viewCon.taskId = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"];
        viewCon.taskCategoryStr = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskCategory"];
        viewCon.RefreshHandle = ^{
            [self refreshHeader];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.faburenwu = ^(NSInteger index) {
        WYZQFaBuFillInTwoViewController *viewCon = [[WYZQFaBuFillInTwoViewController alloc] initWithNibName:@"WYZQFaBuFillInTwoViewController" bundle:nil];
        viewCon.againCreate = YES;
        viewCon.taskId = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"];
        viewCon.taskCategoryStr = [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskCategory"];
        viewCon.RefreshHandle = ^{
            [self refreshHeader];
        };
        [self.navigationController pushViewController:viewCon animated:YES];
    };
    cell.shanchurenwu = ^(NSInteger index) {
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"是否要删除当前任务？" withTitle:@"提示"]];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"删除", nil]];
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
            if (buttonIndex == 0) {
            }else{
                [self loadingHUDAlert:@"正在删除"];
                [[ServiceRequest sharedService] DELETE:[NSString stringWithFormat:@"task/published/%@", [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"]] parameters:nil success:^(id responseObject) {
                    [self hideHudAlert];
                    [self showHUDAlert:@"删除成功"];
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
    cell.jieshurenwu = ^(NSInteger index) {
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"是否要结束当前任务？结束后用户无法领取任务" withTitle:@"提示"]];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"结束", nil]];
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
            if (buttonIndex == 0) {
            }else{
                [self loadingHUDAlert:@"正在结束"];
                [[ServiceRequest sharedService] PUT:[NSString stringWithFormat:@"task-management/%@/stop", [[self->contentMutArr objectAtIndex:index] objectForKey:@"taskNo"]] parameters:nil success:^(id responseObject) {
                    [self hideHudAlert];
                    [self showHUDAlert:@"操作成功"];
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
    NSDictionary *dic = [self->contentMutArr objectAtIndex:indexPath.row];
    WYZQTaskFabuDetailViewController *viewCon = [[WYZQTaskFabuDetailViewController alloc] initWithNibName:@"WYZQTaskFabuDetailViewController" bundle:nil];
    viewCon.taskId = [dic objectForKey:@"taskNo"];
    viewCon.taskCategoryStr = [dic objectForKey:@"taskCategory"];
    viewCon.pageNum = 0;
    viewCon.RefreshHandle = ^{
        [self refreshHeader];
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (NSString *)getStatusStr:(TaskFabuType)type{
    switch (type) {
        case TaskFabuType_shenhezhong:
            return @"待审核";
            break;
        case TaskFabuType_daifukuan:
            return @"待付款";
            break;
        case TaskFabuType_jinxingzhong:
            return @"进行中";
            break;
        case TaskFabuType_dengdaijieshu:
            return @"等待结束";
            break;
        case TaskFabuType_yijieshu:
            return @"已结束";
            break;
        case TaskFabuType_yijujue:
            return @"审核失败";
            break;
        default:
            break;
    }
}
@end
