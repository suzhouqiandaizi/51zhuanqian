#import "BWRZQMyTaskItemViewController.h"
#import "MJRefresh.h"
#import "BWRZQHomeTableViewCell.h"
@interface BWRZQMyTaskItemViewController (){
    NSMutableArray                  *contentMutArr;
    NSInteger                       pageNum;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation BWRZQMyTaskItemViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 0;
    contentMutArr = [NSMutableArray array];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
}
- (void)refreshHeader{
    pageNum = 0;
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
    if ([self.categoryId integerValue] == 0) {
        [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    }else{
        [dic setObject:[NSNumber numberWithInteger:[self.categoryId integerValue]] forKey:@"catid"];
        [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
        [dic setObject:[NSNumber numberWithInteger:2] forKey:@"platform"];
        [dic setObject:@"2.0" forKey:@"version"];
        [dic setObject:@"1.0.12" forKey:@"v"];
    }
    [[ServiceRequest sharedService] POSTCUSTOM:@"http://api.jpm.cn/letter/information" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 0) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"data"];
        for (int i = 0; i < arr.count; i++) {
            [self->contentMutArr addObject:[arr objectAtIndex:i]];
        }
        if (self->contentMutArr.count == 0) {
        }else{
            self.tableView.tableFooterView = nil;
        }
        if (self->pageNum > 0 && arr.count == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        [self.tableView reloadData];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        if (self->pageNum == 0) {
            [self.tableView.mj_header endRefreshing];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        if (code == 0) {
        }else if (code == 404){
            if (self->pageNum == 0) {
                [self->contentMutArr removeAllObjects];
                [self.tableView reloadData];
            }
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self showHUDAlert:error];
        }
    }];
    [self hideHudAlert];
}
#pragma mark - UITableView datasource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentMutArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ExamineTwoCell";
    BWRZQHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQHomeTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [dic objectForKey:@"url"];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
