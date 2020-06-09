#import "BWRZQTaskReadItemViewController.h"
#import "BWRZQTaskReadItemOneTableViewCell.h"
#import "BWRZQTaskReadItemTwoTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "MJRefresh.h"
#import "BWRZQTaskReadViewController.h"
@interface BWRZQTaskReadItemViewController (){
    NSMutableArray                  *contentMutArr;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation BWRZQTaskReadItemViewController
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
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"read-task"];
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
    [dic setObject:self.categoryId forKey:@"taskCategory"];
    [[ServiceRequest sharedService] GET:@"read-task" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"readTaskListDetailDtos"];
        [self->contentMutArr addObjectsFromArray:arr];
        if (self->contentMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 40) withType:LoadErrorTypeNoData withTip:@"暂无内容"];
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
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    if ([[dic objectForKey:@"taskThumbs"] count] > 1) {
        static NSString *cellIdentifier = @"TaskReadItemOneCell";
        BWRZQTaskReadItemOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQTaskReadItemOneTableViewCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.titleLabel.text = [dic objectForKey:@"taskTitle"];
        cell.bottomLabel.text = [NSString stringWithFormat:@"%@   %@", [dic objectForKey:@"fromChannel"], [dic objectForKey:@"createTime"]];
        cell.oneImageView.hidden = YES;
        cell.twoImageView.hidden = YES;
        cell.threeImageView.hidden = YES;
        NSArray *imageArr = [dic objectForKey:@"taskThumbs"];
        for (int i = 0; i < imageArr.count; i++) {
            if (i == 0) {
                cell.oneImageView.hidden = NO;
                [cell.oneImageView sd_setImageWithURL:[NSURL URLWithString:[imageArr objectAtIndex:i]] placeholderImage:PlaceholderImage];
            }else if (i == 1){
                cell.twoImageView.hidden = NO;
                [cell.twoImageView sd_setImageWithURL:[NSURL URLWithString:[imageArr objectAtIndex:i]] placeholderImage:PlaceholderImage];
            }else if (i == 2){
                cell.threeImageView.hidden = NO;
                [cell.threeImageView sd_setImageWithURL:[NSURL URLWithString:[imageArr objectAtIndex:i]] placeholderImage:PlaceholderImage];
            }
        }
        return cell;
    }else{
        static NSString *cellIdentifier = @"TaskReadItemTwoCell";
        BWRZQTaskReadItemTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQTaskReadItemTwoTableViewCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.titleLabel.text = [dic objectForKey:@"taskTitle"];
        cell.bottomLabel.text = [NSString stringWithFormat:@"%@   %@", [dic objectForKey:@"fromChannel"], [dic objectForKey:@"createTime"]];
        NSArray *imageArr = [dic objectForKey:@"taskThumbs"];
        for (int i = 0; i < imageArr.count; i++) {
            if (i == 0) {
                cell.oneImageView.hidden = NO;
                [cell.oneImageView sd_setImageWithURL:[NSURL URLWithString:[imageArr objectAtIndex:i]] placeholderImage:PlaceholderImage];
            }
        }
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    if ([[dic objectForKey:@"taskThumbs"] count] > 1) {
        return 170;
    }else{
        return 113;
    }
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    BWRZQTaskReadViewController *viewCon = [[BWRZQTaskReadViewController alloc] initWithNibName:@"BWRZQTaskReadViewController" bundle:nil];
    viewCon.taskId = [dic objectForKey:@"taskNo"];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
