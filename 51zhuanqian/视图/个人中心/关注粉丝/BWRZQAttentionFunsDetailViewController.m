#import "BWRZQAttentionFunsDetailViewController.h"
#import "MJRefresh.h"
#import "BWRZQAttentionFunsTableViewCell.h"
#import "BWRZQFriendDetailViewController.h"
#import "RefreshErrorAlertView.h"
@interface BWRZQAttentionFunsDetailViewController (){
    NSInteger                  pageNum;
    NSInteger                  pageSize;
    NSMutableArray             *contentMutArr;
    BOOL                       againReload;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation BWRZQAttentionFunsDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    againReload = NO;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (againReload) {
        pageNum = 1;
        [self requestContent:NO];
    }
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    NSString *urlStr = [NSString stringWithFormat:@"user/attention/%@", user.userID];
    if (self.selectedIndex == 1) {
        urlStr = [NSString stringWithFormat:@"user/fan/%@", user.userID];
    }
    [[ServiceRequest sharedService] cancelDataTaskForKey:urlStr];
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
    NSString *urlStr = [NSString stringWithFormat:@"user/attention/%@", user.userID];
    if (self.selectedIndex == 1) {
        urlStr = [NSString stringWithFormat:@"user/fan/%@", user.userID];
    }
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:user.userID forKey:@"fromPlatformId"];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    [[ServiceRequest sharedService] GET:urlStr parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr  removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"attentionDetailDtos"];
        for (int i = 0; i < arr.count; i++) {
            [self->contentMutArr addObject:[arr objectAtIndex:i]];
        }
        if (self->contentMutArr.count == 0) {
            if (self.selectedIndex == 0) {
                self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:self.tableView.frame withType:LoadErrorTypeNoData withTip:@"暂无关注"];
            }else{
                self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:self.tableView.frame withType:LoadErrorTypeNoData withTip:@"暂无粉丝"];
            }
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
    static NSString *cellIdentifier = @"AttentionFunsCell";
    BWRZQAttentionFunsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQAttentionFunsTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *contentDic = [contentMutArr objectAtIndex:indexPath.row];
    [cell.headerImageView sd_setImageWithURL:[NSURL URLWithString:[contentDic objectForKey:@"avatar"]] placeholderImage:PlaceholderImage];
    cell.nameLabel.text = [contentDic objectForKey:@"nickName"];
    if (self.selectedIndex == 0) {
        cell.guanzhuBtn.selected = YES;
    }else{
        cell.guanzhuBtn.selected = [[contentDic objectForKey:@"attentioned"] boolValue];
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    BWRZQFriendDetailViewController *viewCon = [[BWRZQFriendDetailViewController alloc] initWithNibName:@"BWRZQFriendDetailViewController" bundle:nil];
    NSDictionary *contentDic = [contentMutArr objectAtIndex:indexPath.row];
    viewCon.userId = [contentDic objectForKey:@"platformId"];
    viewCon.RefreshHandle = ^{
        self->againReload = YES;
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
