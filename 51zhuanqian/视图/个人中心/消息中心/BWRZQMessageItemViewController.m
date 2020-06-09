#import "BWRZQMessageItemViewController.h"
#import "MJRefresh.h"
#import "BWRZQMessageTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskFabuViewController.h"
#import "BWRZQTaskDoingViewController.h"
@interface BWRZQMessageItemViewController (){
    NSInteger                  pageNum;
    NSInteger                  pageSize;
    NSMutableArray             *contentMutArr;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation BWRZQMessageItemViewController
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
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/message", user.userID]];
}
- (void)refreshFooter{
    pageNum = ++pageNum;
    [self requestContent:NO];
}
- (void)refreshHeader{
    pageNum = 1;
    [self requestContent:NO];
}
- (void)requestContent:(BOOL)alert{
    if (alert) {
        [self loadingHUDAlert:@"正在加载"];
    }
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:user.userID forKey:@"platformId"];
    [dic setObject:[NSNumber numberWithInteger:pageNum] forKey:@"page"];
    [dic setObject:[NSNumber numberWithInteger:pageSize] forKey:@"size"];
    if (self.type == 0) {
        [dic setObject:@"TASK" forKey:@"type"];
    }else{
        [dic setObject:@"SYSTEM" forKey:@"type"];
    }
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/message", user.userID] parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        if (self->pageNum == 1) {
            [self.tableView.mj_header endRefreshing];
            [self->contentMutArr  removeAllObjects];
            [self.tableView.mj_footer resetNoMoreData];
        }else{
            [self.tableView.mj_footer endRefreshing];
        }
        NSArray *arr = [responseObject objectForKey:@"userMessageDetailDtos"];
        [self->contentMutArr addObjectsFromArray:arr];
        if (self->contentMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:self.tableView.frame withType:LoadErrorTypeNoData withTip:@"暂无消息"];
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
    return contentMutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MessageCell";
    BWRZQMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQMessageTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    NSString *contentStr = [dic objectForKey:@"content"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentStr length])];
    CGSize labelSize = [contentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 48, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    cell.contentLabel.text = contentStr;
    cell.contentLabel.attributedText = attributedString;
    [cell.contentLabel setFrame:CGRectMake(10, 69, labelSize.width, labelSize.height)];
    cell.titleLabel.text = [dic objectForKey:@"title"];
    BOOL hasRead = [dic objectForKey:@"status"];
    if (hasRead) {
        cell.dotImageView.hidden = YES;
        [cell.titleLabel setFrame:CGRectMake(10, 13, SCREEN_WIDTH_DEVICE - 16 - 10 - 8, 21)];
    }else{
        cell.dotImageView.hidden = NO;
        [cell.titleLabel setFrame:CGRectMake(26, 13, SCREEN_WIDTH_DEVICE - 16 - 26 - 8, 21)];
    }
    cell.timeLabel.text = dic[@"createTime"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    NSString *contentStr = [dic objectForKey:@"content"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentStr length])];
    CGSize labelSize = [contentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 48, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    return 84 + labelSize.height + 10;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    if (self.type == 0) {
        NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
        if ([[dic objectForKey:@"taskType"] isEqualToString:@"PUBLISHED"]) {
            BWRZQTaskFabuViewController *viewCon = [[BWRZQTaskFabuViewController alloc] initWithNibName:@"BWRZQTaskFabuViewController" bundle:nil];
            viewCon.taskNumDic = self.taskNumDic;
            NSString *taskStatus = [dic objectForKey:@"taskStatus"];
            if ([taskStatus isEqualToString:@"待付款"]) {
                viewCon.selectedIndex = 1;
            }else if ([taskStatus isEqualToString:@"进行中"]){
                viewCon.selectedIndex = 2;
            }else if ([taskStatus isEqualToString:@"等待结束"]){
                viewCon.selectedIndex = 3;
            }else if ([taskStatus isEqualToString:@"已结束"]){
                viewCon.selectedIndex = 4;
            }else if ([taskStatus isEqualToString:@"审核失败"]){
                viewCon.selectedIndex = 5;
            }else{
                viewCon.selectedIndex = 0;
            }
            [self.navigationController pushViewController:viewCon animated:YES];
        }else{
            BWRZQTaskDoingViewController *viewCon = [[BWRZQTaskDoingViewController alloc] initWithNibName:@"BWRZQTaskDoingViewController" bundle:nil];
            viewCon.taskNumDic = self.taskNumDic;
            NSString *taskStatus = [dic objectForKey:@"taskStatus"];
            if ([taskStatus isEqualToString:@"已获赏"]) {
                viewCon.selectedIndex = 3;
            }else if ([taskStatus isEqualToString:@"已拒绝"]){
                viewCon.selectedIndex = 2;
            }else{
                viewCon.selectedIndex = 1;
            }
            [self.navigationController pushViewController:viewCon animated:YES];
        }
    }
}
- (CALayer *)addShadowToView:(UIView *)view shadowOpacity:(float)shadowOpacity shadowRadius:(CGFloat)shadowRadius cornerRadius:(CGFloat)cornerRadius{
    CALayer *shadowLayer = [CALayer layer];
    shadowLayer.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    shadowLayer.shadowColor = [UIColor lightGrayColor].CGColor;
    shadowLayer.shadowOffset = CGSizeMake(0, 0);
    shadowLayer.shadowOpacity = shadowOpacity;
    shadowLayer.shadowRadius = shadowRadius;
    UIBezierPath *path = [UIBezierPath bezierPath];
    float width = shadowLayer.bounds.size.width;
    float height = shadowLayer.bounds.size.height;
    float x = shadowLayer.bounds.origin.x;
    float y = shadowLayer.bounds.origin.y;
    CGPoint topLeft      = shadowLayer.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    CGFloat offset = -1.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    [path addArcWithCenter:CGPointMake(topLeft.x + cornerRadius, topLeft.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI endAngle:M_PI_2 * 3 clockwise:YES];
    [path addLineToPoint:CGPointMake(topRight.x - cornerRadius, topRight.y - offset)];
    [path addArcWithCenter:CGPointMake(topRight.x - cornerRadius, topRight.y + cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 * 3 endAngle:M_PI * 2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y - cornerRadius)];
    [path addArcWithCenter:CGPointMake(bottomRight.x - cornerRadius, bottomRight.y - cornerRadius) radius:(cornerRadius + offset) startAngle:0 endAngle:M_PI_2 clockwise:YES];
    [path addLineToPoint:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y + offset)];
    [path addArcWithCenter:CGPointMake(bottomLeft.x + cornerRadius, bottomLeft.y - cornerRadius) radius:(cornerRadius + offset) startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y + cornerRadius)];
    shadowLayer.shadowPath = path.CGPath;
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    view.layer.shouldRasterize = YES;
    view.layer.rasterizationScale = [UIScreen mainScreen].scale;
    [view.superview.layer insertSublayer:shadowLayer below:view.layer];
    return shadowLayer;
}
@end
