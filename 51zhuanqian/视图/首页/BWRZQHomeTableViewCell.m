#import "BWRZQHomeTableViewCell.h"
#import "GlobalFunction.h"
@interface BWRZQHomeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *statusIconImageView;
@end
@implementation BWRZQHomeTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 5.0f;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.statusIconImageView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.statusIconImageView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.statusIconImageView.layer.mask = maskLayer;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)showContent:(BWRZQTaskObject *)task{
    float originX = 0;
    float width = 30;
    [self.iconView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (task.iconArr.count > 0) {
        for (int i = 0; i < task.iconArr.count; i++) {
            NSDictionary *iconDic = [task.iconArr objectAtIndex:i];
            width = [[iconDic objectForKey:@"width"] floatValue];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, 2.5, width, 16)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:[iconDic objectForKey:@"imageUrl"]]];
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
    [self.detailLabel setFrame:CGRectMake(originX + 71, self.detailLabel.frame.origin.y, SCREEN_WIDTH_DEVICE - originX - 83, self.detailLabel.frame.size.height)];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:task.iconUrl] placeholderImage:PlaceholderImage];
    self.titleLabel.text = task.title;
    self.detailLabel.text = [NSString stringWithFormat:@"%@人已赚·剩余%@份", task.approvedUserCount, task.leftBidTime];
    self.priceLabel.text = task.rewardAmountDisplay;
    self.priceLabel = changeLabelAttribute(self.priceLabel, self.priceLabel.text.length - 1, 0, ThemeColor, ThemeColor, 13.0);
    if (task.taskStatusUrl.length > 0) {
        self.statusIconImageView.hidden = NO;
        [self.statusIconImageView sd_setImageWithURL:[NSURL URLWithString:task.taskStatusUrl]];
    }else{
        self.statusIconImageView.hidden = YES;
    }
}
@end
