#import "WYZQMessageTableViewCell.h"
@interface WYZQMessageTableViewCell()
@end
@implementation WYZQMessageTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.dotImageView.layer.masksToBounds = YES;
    self.dotImageView.layer.cornerRadius = 4.0f;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
