#import "BWRZQTaskClassifyTableViewCell.h"
@implementation BWRZQTaskClassifyTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)clickPress {
    if (self.RefreshHandle) {
        self.RefreshHandle(self);
    }
}
@end
