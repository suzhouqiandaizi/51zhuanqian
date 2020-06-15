#import "WYZQFaBuOneCollectionViewCell.h"
@implementation WYZQFaBuOneCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQFaBuOneCollectionViewCell" owner:self options:nil] lastObject];
    }
    return self;
}
@end
