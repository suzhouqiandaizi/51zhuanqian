#import "BWRZQFaBuOneCollectionViewCell.h"
@implementation BWRZQFaBuOneCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQFaBuOneCollectionViewCell" owner:self options:nil] lastObject];
    }
    return self;
}
@end
