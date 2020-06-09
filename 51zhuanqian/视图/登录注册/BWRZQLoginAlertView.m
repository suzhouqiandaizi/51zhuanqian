#import "BWRZQLoginAlertView.h"
#import "LoadConfig.h"
@interface BWRZQLoginAlertView()
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@end
@implementation BWRZQLoginAlertView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQLoginAlertView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        self.showView.layer.masksToBounds = YES;
        self.showView.layer.cornerRadius = 5.0f;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5;
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        self.contentTextView.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"1、检查是否被手机安全软件拦截；\n2、检查信箱是否已满；\n3、检查手机是否关机、暂无信息、欠费或者停机收不到验证码和短信；\n4、排除以上原因后仍无法收到验证码，请联系我们：%@。", [[[LoadConfig shareStance] getConfig] objectForKey:@"kefurexian"]] attributes:attributes];
        self.contentTextView.textColor = [UIColor lightGrayColor];
    }
    return self;
}
- (IBAction)removePress {
    [self removeFromSuperview];
}
@end
