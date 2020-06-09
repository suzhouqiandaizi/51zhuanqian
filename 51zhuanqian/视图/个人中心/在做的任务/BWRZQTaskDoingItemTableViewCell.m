#import "BWRZQTaskDoingItemTableViewCell.h"
#import "GlobalFunction.h"
@interface BWRZQTaskDoingItemTableViewCell(){
    NSInteger selectedIndex;
}
@property (weak, nonatomic) IBOutlet UIView *btnView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end
@implementation BWRZQTaskDoingItemTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 5.0f;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)showContent:(TaskDoingType)taskType withContentDic:(NSDictionary *)dic witdIndex:(NSInteger)index{
    selectedIndex = index;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"taskThumb"]] placeholderImage:PlaceholderImage];
    self.titleLabel.text = [dic objectForKey:@"taskTitle"];
    self.detailLabel.text = [NSString stringWithFormat:@"%@", [dic objectForKey:@"orderDescriptionInfo"]];
    self.priceLabel.text = [dic objectForKey:@"rewardAmountDisplay"];
    self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 1, 0, ThemeColor, ThemeColor, 13.0);
    float originX = 0;
    float width = 31;
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
    if (taskType == TaskDoingType_daitijiao) {
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80, 0, 80, 25)];
        [fangqiBtn setTitle:@"放弃任务" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = TextGrayColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(fangqirenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 - 105 - 10, 0, 105, 25)];
        [tijiaoBtn setTitle:@"提交任务结果" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = ThemeColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(tijiaorenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
    }else if (taskType == TaskDoingType_daitishenhe){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 - 80 - 10, 0, 80, 25)];
        [fangqiBtn setTitle:@"放弃任务" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = TextGrayColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(fangqirenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 , 0, 80, 25)];
        [tijiaoBtn setTitle:@"重新提交" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = ThemeColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(tijiaorenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
    }else if (taskType == TaskDoingType_weitongguo){
        UIButton *fangqiBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80 - 80 - 10, 0, 80, 25)];
        [fangqiBtn setTitle:@"放弃任务" forState:UIControlStateNormal];
        [fangqiBtn setTitleColor:TextGrayColor forState:UIControlStateNormal];
        fangqiBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        fangqiBtn.layer.masksToBounds = YES;
        fangqiBtn.layer.cornerRadius = 12.5f;
        fangqiBtn.layer.borderColor = TextGrayColor.CGColor;
        fangqiBtn.layer.borderWidth = 0.5f;
        [fangqiBtn addTarget:self action:@selector(fangqirenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:fangqiBtn];
        UIButton *tijiaoBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 8 - 15 - 80, 0, 80, 25)];
        [tijiaoBtn setTitle:@"重新提交" forState:UIControlStateNormal];
        [tijiaoBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        tijiaoBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        tijiaoBtn.layer.masksToBounds = YES;
        tijiaoBtn.layer.cornerRadius = 12.5f;
        tijiaoBtn.layer.borderColor = ThemeColor.CGColor;
        tijiaoBtn.layer.borderWidth = 0.5f;
        [tijiaoBtn addTarget:self action:@selector(tijiaorenwuPress) forControlEvents:UIControlEventTouchUpInside];
        [self.btnView addSubview:tijiaoBtn];
    }else{
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
    }
}
- (void)fangqirenwuPress{
    if (self.fangqirenwu) {
        self.fangqirenwu(selectedIndex);
    }
}
- (void)tijiaorenwuPress{
    if (self.tijiaorenwu) {
        self.tijiaorenwu(selectedIndex);
    }
}
- (void)chakanPress{
    if (self.chakan) {
        self.chakan(selectedIndex);
    }
}
@end
