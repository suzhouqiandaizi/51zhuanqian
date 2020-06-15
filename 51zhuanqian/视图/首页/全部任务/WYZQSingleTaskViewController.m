#import "WYZQSingleTaskViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import "WYZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import "WYZQTaskClassifyView.h"
#import <DyAdSdk/DyAdApi.h>
@interface WYZQSingleTaskViewController ()<TaskClassifyViewDelegate>{
    NSMutableArray                  *contentMutArr;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
    WYZQTaskClassifyView                *alertView;
    NSArray                         *chooseArr;
    NSString                        *chooseStr;
    NSString                        *chooseValueStr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@end
@implementation WYZQSingleTaskViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.titleStr) {
        self.title = self.titleStr;
    }else{
        self.title = @"任务";
    }
    [self addBackBtn];
    [self.tableView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top + 35, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top - 35)];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 35)];
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    if (self.selectedStr) {
        chooseArr = [NSArray arrayWithObject:self.selectedStr];
        [self.oneBtn setTitle:[NSString stringWithFormat:@"任务类型(%lu)", (unsigned long)chooseArr.count] forState:UIControlStateNormal];
    }
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
    [self.oneBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
     self.oneBtn.imageView.frame.size.width, 0, self.oneBtn.imageView.frame.size.width)];
    [self.oneBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.oneBtn.titleLabel.bounds.size.width, 0, - self.oneBtn.titleLabel.bounds.size.width - 5)];
    [self.twoBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
     self.twoBtn.imageView.frame.size.width, 0, self.twoBtn.imageView.frame.size.width)];
    [self.twoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.twoBtn.titleLabel.bounds.size.width, 0, - self.twoBtn.titleLabel.bounds.size.width - 5)];
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
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    if (self.titleStr) {
        [dic setObject:self.titleStr forKey:@"taskTypeName"];
    }
    if (chooseStr.length > 0) {
        [dic setObject:chooseValueStr forKey:@"sortValue"];
    }
    if (chooseArr.count > 0) {
        [dic setObject:[chooseArr componentsJoinedByString:@","] forKey:@"taskCategoryNames"];
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
- (IBAction)onePress {
    if (self.oneBtn.selected) {
        [self removeTaskClassifyView];
        [alertView removeFromSuperview];
    }else{
        if (!alertView) {
            alertView = [[WYZQTaskClassifyView alloc] initItem];
            alertView.delegate = self;
        }
        alertView.type = 1;
        if (![self.view.subviews containsObject:alertView]) {
            [self.view addSubview:alertView];
        }
        [alertView showContent:chooseArr];
        self.oneBtn.selected = YES;
        self.twoBtn.selected = NO;
        [self.oneBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [self.twoBtn setTitleColor:TextColor forState:UIControlStateNormal];
        [self.oneBtn setImage:[UIImage imageNamed:@"renwu_shaixuan_s_btn"] forState:UIControlStateNormal];
        [self.twoBtn setImage:[UIImage imageNamed:@"renwu_shaixuan_n_btn"] forState:UIControlStateNormal];
    }
}
- (IBAction)twoPress {
    if (self.twoBtn.selected) {
        [self removeTaskClassifyView];
        [alertView removeFromSuperview];
    }else{
        if (!alertView) {
            alertView = [[WYZQTaskClassifyView alloc] initItem];
            alertView.delegate = self;
        }
        alertView.type = 2;
        if (![self.view.subviews containsObject:alertView]) {
            [self.view addSubview:alertView];
        }
        [alertView showContent:chooseArr];
        self.oneBtn.selected = NO;
        self.twoBtn.selected = YES;
        [self.twoBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [self.oneBtn setTitleColor:TextColor forState:UIControlStateNormal];
        [self.twoBtn setImage:[UIImage imageNamed:@"renwu_shaixuan_s_btn"] forState:UIControlStateNormal];
        [self.oneBtn setImage:[UIImage imageNamed:@"renwu_shaixuan_n_btn"] forState:UIControlStateNormal];
    }
}
- (void)removeTaskClassifyView{
    self.oneBtn.selected = NO;
    self.twoBtn.selected = NO;
    [self.twoBtn setTitleColor:TextColor forState:UIControlStateNormal];
    [self.oneBtn setTitleColor:TextColor forState:UIControlStateNormal];
    [self.twoBtn setImage:[UIImage imageNamed:@"renwu_shaixuan_n_btn"] forState:UIControlStateNormal];
    [self.oneBtn setImage:[UIImage imageNamed:@"renwu_shaixuan_n_btn"] forState:UIControlStateNormal];
}
- (void)chooseTaskClassifyView:(NSArray *)leixin withSort:(NSString *)sortV withSortValue:(nonnull NSString *)sortValue{
    chooseArr = leixin;
    chooseStr = sortV;
    chooseValueStr = sortValue;
    if (chooseArr.count > 0) {
        [self.oneBtn setTitle:[NSString stringWithFormat:@"任务类型(%lu)", (unsigned long)chooseArr.count] forState:UIControlStateNormal];
    }else{
        [self.oneBtn setTitle:@"任务类型" forState:UIControlStateNormal];
    }
    if (chooseStr.length > 0) {
        [self.twoBtn setTitle:chooseStr forState:UIControlStateNormal];
    }
    [self.oneBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
     self.oneBtn.imageView.frame.size.width, 0, self.oneBtn.imageView.frame.size.width)];
    [self.oneBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.oneBtn.titleLabel.bounds.size.width, 0, - self.oneBtn.titleLabel.bounds.size.width - 5)];
    [self.twoBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -
     self.twoBtn.imageView.frame.size.width, 0, self.twoBtn.imageView.frame.size.width)];
    [self.twoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, self.twoBtn.titleLabel.bounds.size.width, 0, - self.twoBtn.titleLabel.bounds.size.width - 5)];
    pageNum = 1;
    [self requestContent:NO];
}
@end
