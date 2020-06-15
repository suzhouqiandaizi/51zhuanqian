#import "WYZQTaskFabuItemTableViewCell.h"
#import "GlobalFunction.h"
@interface WYZQTaskFabuItemTableViewCell(){
    NSInteger selectedIndex;
}
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIView *iconView;
@end
@implementation WYZQTaskFabuItemTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 5.0f;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)showContent:(TaskFabuType)taskType withContentDic:(NSDictionary *)dic witdIndex:(NSInteger)index{
    selectedIndex = index;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"taskThumb"]] placeholderImage:PlaceholderImage];
    self.titleLabel.text = [dic objectForKey:@"taskTitle"];
    NSString *taskDescriptionInfo = [dic objectForKey:@"taskDescriptionInfo"];
    NSString *taskReadyToApproveDescription = [dic objectForKey:@"taskReadyToApproveDescription"];
    if (taskReadyToApproveDescription.length > 0) {
        self.detailLabel.text = [NSString stringWithFormat:@"%@ | %@", taskDescriptionInfo, taskReadyToApproveDescription];
        changeLabelAttribute(self.detailLabel, self.detailLabel.text.length - taskReadyToApproveDescription.length, 0, TextGrayColor, RGB(255, 176, 47), 12.0f);
    }else{
        self.detailLabel.text = taskDescriptionInfo;
    }
    float originX = 0;
    float width = 30;
    [self.iconView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray *iconArr = [dic objectForKey:@"typeAndTagIcons"];
    if (iconArr.count > 0) {
        for (int i = 0; i < iconArr.count; i++) {
            width = [[[iconArr objectAtIndex:i] objectForKey:@"width"] floatValue];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, 2.5, width, 16)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[[iconArr objectAtIndex:i] objectForKey:@"imageUrl"]]];
            [self.iconView addSubview:imageView];
            originX = originX + width + 8;
        }
    }
    if (originX == 0) {
        self.iconView.hidden = YES;
    }else{
        self.iconView.hidden = NO;
        [self.iconView setFrame:CGRectMake(71, self.iconView.frame.origin.y, originX, 21)];
    }
    [self.detailLabel setFrame:CGRectMake(originX + 71, self.detailLabel.frame.origin.y, SCREEN_WIDTH_DEVICE - originX - 8, self.detailLabel.frame.size.height)];
    [self.btnView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (taskType == TaskFabuType_shenhezhong) {
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80, 0, 80, 25)];
        [fangqiBtn setTitle:@"查看任务" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(chakanPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 - 80 - 10, 0, 80, 25)];
        [tijiaoBtn setTitle:@"删除任务" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = TextGrayColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(shanchurenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
        UIButton *xiugaBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 - 80 - 10 - 80 - 10, 0, 80, 25)];
        [xiugaBtn setTitle:@"修改任务" forState:UIControlStateNormal];
        [xiugaBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        xiugaBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        xiugaBtn.layer.masksToBounds = YES;
        xiugaBtn.layer.cornerRadius = 12.5f;
        xiugaBtn.layer.borderColor = TextGrayColor.CGColor;
        xiugaBtn.layer.borderWidth = 0.5f;
        [xiugaBtn addTarget:self action:@selector(xiugairenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:xiugaBtn];
    }else if (taskType == TaskFabuType_daifukuan){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 70, 0, 70, 25)];
        [fangqiBtn setTitle:@"去付款" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(fukuanPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 70 - 80 - 10, 0, 80, 25)];
        [tijiaoBtn setTitle:@"删除任务" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = TextGrayColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(shanchurenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
        UIButton *xiugaBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 70 - 80 - 10 - 80 - 10, 0, 80, 25)];
        [xiugaBtn setTitle:@"修改任务" forState:UIControlStateNormal];
        [xiugaBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        xiugaBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        xiugaBtn.layer.masksToBounds = YES;
        xiugaBtn.layer.cornerRadius = 12.5f;
        xiugaBtn.layer.borderColor = TextGrayColor.CGColor;
        xiugaBtn.layer.borderWidth = 0.5f;
        [xiugaBtn addTarget:self action:@selector(xiugairenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:xiugaBtn];
    }else if (taskType == TaskFabuType_yijujue){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80, 0, 80, 25)];
        [fangqiBtn setTitle:@"修改任务" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(xiugairenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 - 80 - 10, 0, 80, 25)];
        [tijiaoBtn setTitle:@"删除任务" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = TextGrayColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(shanchurenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
    }else if (taskType == TaskFabuType_jinxingzhong){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105, 0, 105, 25)];
        [fangqiBtn setTitle:@"查看任务结果" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(chakanResultPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105 - 80 - 10, 0, 80, 25)];
        [tijiaoBtn setTitle:@"结束任务" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = TextGrayColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(jieshurenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
    }else if(taskType == TaskFabuType_dengdaijieshu){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105, 0, 105, 25)];
        [fangqiBtn setTitle:@"查看任务结果" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(chakanResultPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *xiugaiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105 - 80 - 10, 0, 80, 25)];
        [xiugaiBtn setTitle:@"重新发布" forState:UIControlStateNormal];
        [xiugaiBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        xiugaiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        xiugaiBtn.layer.masksToBounds = YES;
        xiugaiBtn.layer.cornerRadius = 12.5f;
        xiugaiBtn.layer.borderColor = TextGrayColor.CGColor;
        xiugaiBtn.layer.borderWidth = 0.5f;
        [xiugaiBtn addTarget:self action:@selector(fabuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:xiugaiBtn];
    }else if(taskType == TaskFabuType_yijieshu){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105, 0, 105, 25)];
        [fangqiBtn setTitle:@"查看任务结果" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(chakanResultPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *xiugaiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105 - 80 - 10, 0, 80, 25)];
        [xiugaiBtn setTitle:@"重新发布" forState:UIControlStateNormal];
        [xiugaiBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        xiugaiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        xiugaiBtn.layer.masksToBounds = YES;
        xiugaiBtn.layer.cornerRadius = 12.5f;
        xiugaiBtn.layer.borderColor = TextGrayColor.CGColor;
        xiugaiBtn.layer.borderWidth = 0.5f;
        [xiugaiBtn addTarget:self action:@selector(fabuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:xiugaiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105 - 80 - 10 - 80 - 10, 0, 80, 25)];
        [tijiaoBtn setTitle:@"删除任务" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = TextGrayColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(shanchurenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
    }else{
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 105, 0, 105, 25)];
        [fangqiBtn setTitle:@"查看任务结果" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = ThemeColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(chakanResultPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
    }
}
- (void)chakanPress{
    if (self.chakan) {
        self.chakan(selectedIndex);
    }
}
- (void)chakanResultPress{
    if (self.chakanResult) {
        self.chakanResult(selectedIndex);
    }
}
- (void)fukuanPress{
    if (self.fukuan) {
        self.fukuan(selectedIndex);
    }
}
- (void)xiugairenwuPress{
    if (self.xiugairenwu) {
        self.xiugairenwu(selectedIndex);
    }
}
- (void)fabuPress{
    if (self.faburenwu) {
        self.faburenwu(selectedIndex);
    }
}
- (void)shanchurenwuPress{
    if (self.shanchurenwu) {
        self.shanchurenwu(selectedIndex);
    }
}
- (void)jieshurenwuPress{
    if (self.jieshurenwu) {
        self.jieshurenwu(selectedIndex);
    }
}
@end
