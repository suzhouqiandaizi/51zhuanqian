#import "BWRZQSubmitSuccessInfoView.h"
@interface BWRZQSubmitSuccessInfoView()
@property (weak, nonatomic) IBOutlet UIView *infoView;
@end
@implementation BWRZQSubmitSuccessInfoView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQSubmitSuccessInfoView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        self.infoView.layer.cornerRadius = 5.0f;
    }
    return self;
}
- (IBAction)removePress {
    if (self.BackHandle) {
        self.BackHandle();
    }
    [self removeFromSuperview];
}
@end
