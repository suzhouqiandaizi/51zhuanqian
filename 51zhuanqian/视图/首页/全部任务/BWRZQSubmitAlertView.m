#import "BWRZQSubmitAlertView.h"
@interface BWRZQSubmitAlertView()
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end
@implementation BWRZQSubmitAlertView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQSubmitAlertView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE, SCREEN_WIDTH_DEVICE, 221 + IS_iPhoneX_Bottom)];
        [UIView animateWithDuration:0.3 animations:^{
            [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - 221 - IS_iPhoneX_Bottom, SCREEN_WIDTH_DEVICE, 221 + IS_iPhoneX_Bottom)];
        }];
    }
    return self;
}
- (IBAction)removePress {
    [UIView animateWithDuration:0.2 animations:^{
        [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE, SCREEN_WIDTH_DEVICE, 221 + IS_iPhoneX_Bottom)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (IBAction)neverShowPress {
    [DEFAULTS setBool:YES forKey:@"NEVERSHOWSUBMITALERT"];
    [DEFAULTS synchronize];
    [self removePress];
}
- (IBAction)surePress {
    if (self.SureHandle) {
        self.SureHandle();
    }
    [self removePress];
}
@end
