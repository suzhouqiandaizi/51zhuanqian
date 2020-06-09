#import "BWRZQTaskReadItemOneTableViewCell.h"
@implementation BWRZQTaskReadItemOneTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    float imageHeight = (SCREEN_WIDTH_DEVICE - 30 - 20)/3.0;
    [self.oneImageView setFrame:CGRectMake(15, self.oneImageView.frame.origin.y, imageHeight, 72)];
    [self.twoImageView setFrame:CGRectMake(15 + imageHeight + 10, self.oneImageView.frame.origin.y, imageHeight, 72)];
    [self.threeImageView setFrame:CGRectMake(15 + ( imageHeight + 10) * 2, self.oneImageView.frame.origin.y, imageHeight, 72)];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
@end
