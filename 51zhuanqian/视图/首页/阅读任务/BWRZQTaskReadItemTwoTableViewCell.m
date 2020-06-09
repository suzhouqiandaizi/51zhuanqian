#import "BWRZQTaskReadItemTwoTableViewCell.h"
@implementation BWRZQTaskReadItemTwoTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    float imageHeight = (SCREEN_WIDTH_DEVICE - 30 - 20)/3.0;
    [self.oneImageView setFrame:CGRectMake(SCREEN_WIDTH_DEVICE - 15 - imageHeight, self.oneImageView.frame.origin.y, imageHeight, 72)];
    [self.titleLabel setFrame:CGRectMake(15, self.titleLabel.frame.origin.y, SCREEN_WIDTH_DEVICE - 15 - self.oneImageView.frame.origin.x - 8, 44)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
