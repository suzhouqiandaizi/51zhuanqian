#import "WYZQBlacklistViewController.h"
#import "WYZQBlacklistTableViewCell.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
@interface WYZQBlacklistViewController (){
    NSInteger                  pageNum;
    NSInteger                  pageSize;
    NSMutableArray             *contentMutArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQBlacklistViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"黑名单管理";
    [self addBackBtn];
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
    [self.tableView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Top - IS_iPhoneX_Bottom - 64)];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"user/black-list"];
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
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [[ServiceRequest sharedService] GET:@"user/black-list" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr  removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"blackListDetailDtos"];
        for (int i = 0; i < arr.count; i++) {
            [self->contentMutArr addObject:[arr objectAtIndex:i]];
        }
        if (self->contentMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:self.tableView.frame withType:LoadErrorTypeNoData withTip:@"暂无黑名单"];
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
        [self showHUDAlert:error];
    }];
}
#pragma mark - UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentMutArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BlacklistCell";
    WYZQBlacklistTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQBlacklistTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.selectIndex = indexPath.row;
    cell.CancelHandle = ^(NSInteger index){
        [self showHUDAlert:@"正在取消"];
        NSDictionary *dic = [self->contentMutArr objectAtIndex:index];
        [[ServiceRequest sharedService] DELETE:[NSString stringWithFormat:@"user/black-list/%@", [dic objectForKey:@"blackUserPlatformId"]] parameters:nil success:^(id responseObject) {
            [self hideHudAlert];
            [self showHUDAlert:@"取消成功"];
            [self refreshHeader];
        } failure:^(NSString *error, NSInteger code) {
            [self hideHudAlert];
            [self showHUDAlert:error];
        }];
    };
    NSDictionary *contentDic = [contentMutArr objectAtIndex:indexPath.row];
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"avatar"]] placeholderImage:PlaceholderImage];
    cell.nameLabel.text = [contentDic objectForKey:@"blackUserUserName"];
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}
@end
