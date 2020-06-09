#import "BWRZQLoginPrivacyProtocolView.h"
#import "UILabel+YBAttributeTextTapAction.h"
@interface BWRZQLoginPrivacyProtocolView()
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end
@implementation BWRZQLoginPrivacyProtocolView
- (id)initItem{
    self = [[[NSBundle mainBundle] loadNibNamed:@"BWRZQLoginPrivacyProtocolView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.textView setContentOffset:CGPointMake(0, 0)];
        });
        self.showView.layer.masksToBounds = YES;
        self.showView.layer.cornerRadius = 5.0f;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5;
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        NSMutableAttributedString *attributeStr1 = [[NSMutableAttributedString alloc] initWithString:self.textView.text attributes:attributes];
        [attributeStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0,5)];
        [attributeStr1 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0,5)];
        [attributeStr1 addAttribute:NSForegroundColorAttributeName value:TextColor range:NSMakeRange(5,self.textView.text.length - 5)];
        self.textView.attributedText = attributeStr1;
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.infoLabel.text];
        [text addAttribute:NSForegroundColorAttributeName value:ThemeColor range:[self.infoLabel.text rangeOfString:@"51赚钱服务协议"]];
        [text addAttribute:NSForegroundColorAttributeName value:ThemeColor range:[self.infoLabel.text rangeOfString:@"51赚钱隐私保护指引"]];
        self.infoLabel.attributedText = text;
        [self.infoLabel yb_addAttributeTapActionWithStrings:@[@"51赚钱服务协议",@"51赚钱隐私保护指引"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
            if ([string isEqualToString:@"51赚钱隐私保护指引"]) {
                if (self.ClikcHandle) {
                    self.ClikcHandle([NSString stringWithFormat:@"%@/app_51zhuanqian/privacyProtocol/index.html", HOSTURL]);
                }
            }else{
                if (self.ClikcHandle) {
                    self.ClikcHandle([NSString stringWithFormat:@"%@/app_51zhuanqian/serverProtocol/index.html", HOSTURL]);
                }
            }
        }];
    }
    return self;
}
- (IBAction)removePress {
}
- (IBAction)exitPress {
    exit(1);
}
- (IBAction)agreePress {
    [DEFAULTS setBool:YES forKey:@"SHOWPRIVACYPROTOCOL"];
    [DEFAULTS synchronize];
    [self removeFromSuperview];
}
@end
