#import "WYZQCoinRecordViewController.h"
#import "WYZQCoinRecordTableViewCell.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
@interface WYZQCoinRecordViewController (){
    NSMutableArray                  *monthMutArr;
    NSMutableDictionary             *monthMutDic;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQCoinRecordViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    pageSize = 15;
    monthMutArr = [NSMutableArray array];
    monthMutDic = [NSMutableDictionary dictionary];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    if (self.type == RecordType_coin) {
        [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/coin-exchanges", user.userID]];
    }else{
        [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/exchanges", user.userID]];
    }
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
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [dic setObject:user.userID forKey:@"platformId"];
    if (self.fenlei == 0) {
        [dic setObject:@"收入" forKey:@"exchangeType"];
    }else{
        [dic setObject:@"支出" forKey:@"exchangeType"];
    }
    NSString *urlStr = @"";
    if (self.type == RecordType_coin) {
        urlStr = [NSString stringWithFormat:@"user/%@/coin-exchanges", user.userID];
    }else{
        urlStr = [NSString stringWithFormat:@"user/%@/exchanges", user.userID];
    }
    [[ServiceRequest sharedService] GET:urlStr parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->monthMutArr removeAllObjects];
            [self->monthMutDic removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = nil;
        if (self.type == RecordType_coin) {
            arr = [responseObject objectForKey:@"coinExchangeDtos"];
        }else{
            arr = [responseObject objectForKey:@"userExchangeInfos"];
        }
        for (int i = 0; i < arr.count; i++) {
            NSString *monthStr = [[arr objectAtIndex:i] objectForKey:@"month"];
            NSMutableArray *mutArr = [self->monthMutDic objectForKey:monthStr];
            if (mutArr) {
                [mutArr addObject:[arr objectAtIndex:i]];
            }else{
                [self->monthMutArr addObject:monthStr];
                mutArr = [NSMutableArray array];
                [mutArr addObject:[arr objectAtIndex:i]];
            }
            [self->monthMutDic setObject:mutArr forKey:monthStr];
        }
        if (self->monthMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 40) withType:LoadErrorTypeNoData withTip:@"暂无记录"];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return monthMutArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[monthMutDic objectForKey:[monthMutArr objectAtIndex:section]] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *contentView = [[UIView alloc] init];
    [contentView setBackgroundColor:RGB(245, 247, 250)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH_DEVICE - 30, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = TextGrayColor;
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = [monthMutArr objectAtIndex:section];
    [contentView addSubview:label];
    return contentView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CoinRecordCell";
    WYZQCoinRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQCoinRecordTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSArray *contentMutArr = [monthMutDic objectForKey:[monthMutArr objectAtIndex:indexPath.section]];
    if (indexPath.row == [contentMutArr count]-1) {
        cell.lineImageView.hidden = YES;
    }else{
        cell.lineImageView.hidden = NO;
    }
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    if (self.type == RecordType_coin) {
        cell.timeLabel.text = [dic objectForKey:@"createTime"];
    }else{
        cell.timeLabel.text = [dic objectForKey:@"exchangeDay"];
    }
    cell.titleLabel.text = [dic objectForKey:@"description"];
    cell.coinLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"amount"]];
    NSString *desStr = [dic objectForKey:@"statusDescription"];
    if (desStr.length > 0) {
        cell.desLabel.text = [dic objectForKey:@"statusDescription"];
        [cell.coinLabel setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 80 - 8, 7, 80, 21)];
    }else{
        cell.desLabel.text = @"";
        [cell.coinLabel setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 80 - 8, 17, 80, 21)];
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}
@end
