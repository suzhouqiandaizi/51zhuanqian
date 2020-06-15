#import "WYZQTaskDetailTwoAlertView.h"
#import "GlobalFunction.h"
@interface WYZQTaskDetailTwoAlertView()
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end
@implementation WYZQTaskDetailTwoAlertView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WYZQTaskDetailTwoAlertView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        self.showView.layer.masksToBounds = YES;
        self.showView.layer.cornerRadius = 5.0f;
        self.sureBtn.layer.masksToBounds = YES;
        self.sureBtn.layer.cornerRadius = 5.0f;
        [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.contentLabel.text];
               NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
               [paragraphStyle setLineSpacing:4];
               [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.contentLabel.text length])];
        self.contentLabel.attributedText = attributedString;
    }
    return self;
}
- (IBAction)removePress {
    [self removeFromSuperview];
}
- (IBAction)surePress {
    [self removePress];
}
- (IBAction)neverShowPress {
    [DEFAULTS setBool:YES forKey:@"NEVERSHOWTASKDETAILALERT"];
    [DEFAULTS synchronize];
    [self removePress];
}
@end
