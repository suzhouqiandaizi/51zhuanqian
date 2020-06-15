#import "WYZQTaskFabuResultViewController.h"
#import "WYZQTaskFabuResultTableViewCell.h"
#import "MJRefresh.h"
#import "RefreshErrorAlertView.h"
#import "MIPhotoBrowser.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "CustomTextViewAlertView.h"
@interface WYZQTaskFabuResultViewController ()<MIPhotoBrowserDelegate>{
    NSMutableArray                  *contentMutArr;
    NSArray                         *currentImageArr;
    NSMutableDictionary             *contentImageMutDic;
    NSInteger                       pageNum;
    NSInteger                       pageSize;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation WYZQTaskFabuResultViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    pageSize = 15;
    contentMutArr = [NSMutableArray array];
    contentImageMutDic = [NSMutableDictionary dictionary];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHeader)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
    [self requestContent:YES];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"task/published/%@/orders", self.taskId]];
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
    [dic setObject:[self getStatusStr:self.type] forKey:@"orderStatus"];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"task/published/%@/orders", self.taskId] parameters:dic success:^(id responseObject) {
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
        NSArray *arr = [responseObject objectForKey:@"taskOrderSumitInfoDtos"];
        [self->contentMutArr addObjectsFromArray:arr];
        if (self->contentMutArr.count == 0) {
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, self.viewHeight) withType:LoadErrorTypeNoData withTip:@"暂无记录"];
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
            self.tableView.tableFooterView = [[RefreshErrorAlertView alloc] initItem:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, self.viewHeight) withType:LoadErrorTypeNoNetwork withTip:@"网络错误"];
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
    static NSString *cellIdentifier = @"TaskFabuResultCell";
    WYZQTaskFabuResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"WYZQTaskFabuResultTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    cell.topInfoLabel.text = [NSString stringWithFormat:@"提交人：%@   提交时间：%@", [dic objectForKey:@"nickName"], [dic objectForKey:@"submitTime"]];
    NSString *commentStr = [dic objectForKey:@"comment"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:commentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [commentStr length])];
    CGSize labelSize = [commentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 15 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    [cell.commentLabel setFrame:CGRectMake(15, 30, labelSize.width, labelSize.height + 20)];
    cell.commentLabel.attributedText = attributedString;
    cell.commentLabel.text = commentStr;
    [cell.contentImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [cell.contentImageView setFrame:CGRectMake(0, 30 + labelSize.height + 20, SCREEN_WIDTH_DEVICE, 90)];
    NSArray *images = [dic objectForKey:@"submitImages"];
    NSMutableArray *imageMutArr = [NSMutableArray array];
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15 + (90 + 10) * i, 0, 90, 90)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:[images objectAtIndex:i]] placeholderImage:PlaceholderImage];
        imageView.tag = indexPath.row;
        imageView.userInteractionEnabled = YES;
        [cell.contentImageView addSubview:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(requirementTapAction:)];
        [imageView addGestureRecognizer:tap];
        [imageMutArr addObject:imageView];
    }
    [contentImageMutDic setObject:imageMutArr forKey:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    [cell.btnView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (self.type == TaskType_daishenhe) {
        cell.btnView.hidden = NO;
        UIButton *tongguoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 60, 0, 60, 25)];
        [tongguoBtn setTitle:@"通过" forState:UIControlStateNormal];
        [tongguoBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        tongguoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tongguoBtn.layer.masksToBounds = YES;
        tongguoBtn.layer.cornerRadius = 12.5f;
        tongguoBtn.layer.borderColor = ThemeColor.CGColor;
        tongguoBtn.layer.borderWidth = 0.5f;
        tongguoBtn.tag = indexPath.row;
        [tongguoBtn addTarget:self action:@selector(tongguoPress:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnView addSubview:tongguoBtn];
        UIButton *jujueBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 60 - 60 - 10, 0, 60, 25)];
        [jujueBtn setTitle:@"拒绝" forState:UIControlStateNormal];
        [jujueBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        jujueBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        jujueBtn.layer.masksToBounds = YES;
        jujueBtn.layer.cornerRadius = 12.5f;
        jujueBtn.layer.borderColor = ThemeColor.CGColor;
        jujueBtn.layer.borderWidth = 0.5f;
        jujueBtn.tag = indexPath.row;
        [jujueBtn addTarget:self action:@selector(jujuePress:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnView addSubview:jujueBtn];
    }else if (self.type == TaskType_yijujue){
        cell.btnView.hidden = YES;
    }else{
        cell.btnView.hidden = YES;
    }
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = [contentMutArr objectAtIndex:indexPath.row];
    NSString *commentStr = [dic objectForKey:@"comment"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:commentStr];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [commentStr length])];
    CGSize labelSize = [commentStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH_DEVICE - 15 - 8, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    float btnViewHeight = 0;
    if (self.type == TaskType_daishenhe) {
        btnViewHeight = 25 + 10;
    }
    float imageViewHeight = 0;
    if ([[dic objectForKey:@"submitImages"] count] > 0) {
        imageViewHeight = 90;
    }
    return 30 + labelSize.height + 20 + imageViewHeight + 10 + 10 + btnViewHeight;
}
- (void)laheiPress:(id)sender{
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"拉黑后，该用户无法再提交本任务结果" withTitle:@"确定拉黑该用户？"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"拉黑", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
        }else{
            [self loadingHUDAlert:@"请稍候"];
            UIButton *btn = (UIButton *)sender;
            NSDictionary *dic = [self->contentMutArr objectAtIndex:btn.tag];
            NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
            [mutDic setObject:[dic objectForKey:@"orderNo"] forKey:@"orderNo"];
            [[ServiceRequest sharedService] PUT:[NSString stringWithFormat:@"task-order/%@/black-list", [dic objectForKey:@"orderNo"]] parameters:mutDic success:^(id responseObject) {
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
}
- (void)tongguoPress:(id)sender{
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"通过后，奖赏将自动转到对方账户内。" withTitle:@"要通过该任务结果？"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"通过", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
        }else{
            [self loadingHUDAlert:@"请稍候"];
            UIButton *btn = (UIButton *)sender;
            NSDictionary *dic = [self->contentMutArr objectAtIndex:btn.tag];
            NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
            [mutDic setObject:@"通过" forKey:@"verifyStatus"];
            [mutDic setObject:[dic objectForKey:@"orderNo"] forKey:@"orderNo"];
            [[ServiceRequest sharedService] PUT:[NSString stringWithFormat:@"task-management/task-order/%@", [dic objectForKey:@"orderNo"]] parameters:mutDic success:^(id responseObject) {
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
}
- (void)jujuePress:(id)sender{
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomTextViewAlertView alloc] initItemTitle:@"请输入拒绝理由"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"提交", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
        }else{
            if (((CustomTextViewAlertView *)alertView.containerView).contentView.text.length == 0 || [((CustomTextViewAlertView *)alertView.containerView).contentView.text isEqualToString:@"请详细描述拒绝任务结果的理由。"]) {
                [self showHUDAlert:@"请输入拒绝理由"];
            }else{
                [self loadingHUDAlert:@"请稍候"];
                UIButton *btn = (UIButton *)sender;
                NSDictionary *dic = [self->contentMutArr objectAtIndex:btn.tag];
                NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
                [mutDic setObject:@"拒绝" forKey:@"verifyStatus"];
                [mutDic setObject:((CustomTextViewAlertView *)alertView.containerView).contentView.text forKey:@"comment"];
                [mutDic setObject:[dic objectForKey:@"orderNo"] forKey:@"orderNo"];
                [[ServiceRequest sharedService] PUT:[NSString stringWithFormat:@"task-management/task-order/%@", [dic objectForKey:@"orderNo"]] parameters:mutDic success:^(id responseObject) {
                    [self hideHudAlert];
                    [self refreshHeader];
                } failure:^(NSString *error, NSInteger code) {
                    [self hideHudAlert];
                    [self showHUDAlert:error];
                }];
            }
        }
    }];
    [alertView setUseMotionEffects:true];
    [self.view endEditing:YES];
    [alertView show];
}
- (void)showReasonPress{
}
- (void)requirementTapAction:(UIGestureRecognizer *)gesture{
    UIImageView *imageView = (UIImageView *)gesture.view;
    currentImageArr = [contentImageMutDic objectForKey:[NSString stringWithFormat:@"%ld", imageView.tag]];
    MIPhotoBrowser *photoBrowser = [[MIPhotoBrowser alloc] init];
    photoBrowser.delegate = self;
    photoBrowser.sourceImagesContainerView = imageView.superview;
    photoBrowser.currentImgaeView = imageView;
    photoBrowser.imageCount = currentImageArr.count;
    photoBrowser.currentImageIndex = [currentImageArr indexOfObject:imageView];
    [photoBrowser show];
}
- (UIImage *)photoBrowser:(MIPhotoBrowser *)photoBrowser placeholderImageForIndex:(NSInteger)index{
    UIImageView *imageView = currentImageArr[index];
    return imageView.image;
}
- (NSString *)getStatusStr:(TaskFabuResultType)type{
    switch (type) {
        case TaskType_daishenhe:
            return @"待审核";
            break;
        case TaskType_yitongguo:
            return @"已通过";
            break;
        case TaskType_yijujue:
            return @"已拒绝";
            break;
        default:
            break;
    }
}
@end
