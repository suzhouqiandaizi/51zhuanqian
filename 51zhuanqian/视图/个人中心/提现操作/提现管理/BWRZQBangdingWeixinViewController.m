#import "BWRZQBangdingWeixinViewController.h"
@interface BWRZQBangdingWeixinViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITextField *oneTextField;
@end
@implementation BWRZQBangdingWeixinViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isChange) {
        self.title = @"修改微信账户";
        [self.sureBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    }else{
        self.title = @"绑定微信账户";
        [self.sureBtn setTitle:@"确认绑定" forState:UIControlStateNormal];
    }
    [self addBackBtn];
    [self.contentView setFrame:CGRectMake(0, 84 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    [self.sureBtn setFrame:CGRectMake(15, self.contentView.frame.origin.y + self.contentView.frame.size.height + 30, SCREEN_WIDTH_DEVICE - 30, 44)];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 22.0f;
    UserInfo *user = [UserManger currentLoggedInUser];
}
- (IBAction)surePress {
    if (self.oneTextField.text.length == 0) {
        [self showHUDAlert:@"请输入微信账号"];
        return;
    }
    [self loadingHUDAlert:@"正在绑定"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.oneTextField.text forKey:@"wechatAccount"];
    [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"user/%@", user.phone] parameters:dic success:^(id responseObject) {
        [self showHUDAlert:@"绑定成功"];
        [UserManger setUser:user];
        [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
@end
