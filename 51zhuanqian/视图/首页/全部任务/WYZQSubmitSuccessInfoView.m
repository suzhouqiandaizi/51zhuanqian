#import "WYZQSubmitSuccessInfoView.h"
@interface WYZQSubmitSuccessInfoView()
@property (weak, nonatomic) IBOutlet UIView *infoView;
@end
@implementation WYZQSubmitSuccessInfoView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQSubmitSuccessInfoView" owner:self options:nil] lastObject];
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
