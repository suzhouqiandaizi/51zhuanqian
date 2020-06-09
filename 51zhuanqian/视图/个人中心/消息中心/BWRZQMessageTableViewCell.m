#import "BWRZQMessageTableViewCell.h"
@interface BWRZQMessageTableViewCell()
@end
@implementation BWRZQMessageTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.dotImageView.layer.masksToBounds = YES;
    self.dotImageView.layer.cornerRadius = 4.0f;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
