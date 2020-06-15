#import "WYZQJiaoyimingxiViewController.h"
#import "WYZQJiaoyimingxiTableViewCell.h"
#import "MJRefresh.h"
@interface WYZQJiaoyimingxiViewController (){
    NSInteger                  pageNum;
    NSMutableArray             *contentMutArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQJiaoyimingxiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易明细";
    [self addBackBtn];
    [self.tableView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top)];
    pageNum = 0;
    contentMutArr = [NSMutableArray array];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}
- (void)refreshHeader{
}
- (void)refreshFooter{
}
#pragma mark - UITableView datasource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case 0:
        {
            rows = 2;
        } break;
        case 1:
        {
            rows = 3;
        } break;
        case 2:
        {
            rows = 4;
        } break;
        case 3:
        {
            rows = 1;
        } break;
        case 4:
        {
            rows = 1;
        } break;
        default:
            break;
    }
    return rows;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *contentView = [[UIView alloc] init];
    [contentView setBackgroundColor:ViewBackgroundColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH_DEVICE - 15, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = TextGrayColor;
    label.font = [UIFont systemFontOfSize:14.0];
    if (section == 0) {
        label.text = @"2018年8月";
    }else if (section == 1){
        label.text = @"2018年7月";
    }else if (section == 2){
        label.text = @"2018年6月";
    }else if (section == 3){
        label.text = @"补充说明";
    }else if (section == 4){
        label.text = @"单子标签";
    }
    [contentView addSubview:label];
    return contentView;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"JiaoyimingxiCell";
    WYZQJiaoyimingxiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQJiaoyimingxiTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}
@end
