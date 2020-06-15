#import "WYZQFaBuFillInBuZhouTypeAlertView.h"
@interface WYZQFaBuFillInBuZhouTypeAlertView()
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UIButton *tuwenBtn;
@property (weak, nonatomic) IBOutlet UIButton *wangzhiBtn;
@property (weak, nonatomic) IBOutlet UIButton *fuzhiBtn;
@end
@implementation WYZQFaBuFillInBuZhouTypeAlertView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQFaBuFillInBuZhouTypeAlertView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        self.showView.layer.masksToBounds = YES;
        self.showView.layer.cornerRadius = 5.0f;
        self.tuwenBtn.layer.masksToBounds = YES;
        self.tuwenBtn.layer.cornerRadius = 3.0f;
        self.wangzhiBtn.layer.masksToBounds = YES;
        self.wangzhiBtn.layer.cornerRadius = 3.0f;
        self.fuzhiBtn.layer.masksToBounds = YES;
        self.fuzhiBtn.layer.cornerRadius = 3.0f;
    }
    return self;
}
- (IBAction)removePress {
    [self removeFromSuperview];
}
- (IBAction)tuwenPress {
    if ([self.delegate respondsToSelector:@selector(selectBuZhouType:)]) {
        [self.delegate selectBuZhouType:1];
    }
    [self removeFromSuperview];
}
- (IBAction)wangzhiPress {
    if ([self.delegate respondsToSelector:@selector(selectBuZhouType:)]) {
        [self.delegate selectBuZhouType:2];
    }
    [self removeFromSuperview];
}
- (IBAction)fuzhiPress {
    if ([self.delegate respondsToSelector:@selector(selectBuZhouType:)]) {
        [self.delegate selectBuZhouType:3];
    }
    [self removeFromSuperview];
}
@end
