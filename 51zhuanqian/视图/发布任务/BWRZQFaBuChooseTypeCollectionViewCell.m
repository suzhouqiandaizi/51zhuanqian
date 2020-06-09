#import "BWRZQFaBuChooseTypeCollectionViewCell.h"
@implementation BWRZQFaBuChooseTypeCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleBtn.layer.masksToBounds = YES;
    self.titleBtn.layer.cornerRadius = 3.0f;
}
- (IBAction)clickPress{
    if (self.RefreshHandle) {
        self.RefreshHandle(self);
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQFaBuChooseTypeCollectionViewCell" owner:self options:nil] lastObject];
    }
    return self;
}
@end
