#import "BWRZQLoginPasswordViewController.h"
#import "GlobalFunction.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "JPUSHService.h"
#import "BWRZQHomeViewController.h"
#import "SharedViewControllers.h"
#import "LoadConfig.h"
@interface BWRZQLoginPasswordViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *yaoqingTextField;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *bottomInfoLabel;
@property (assign, nonatomic) BOOL        phoneInputBool;
@property (assign, nonatomic) BOOL        codeInputBool;
@end
@implementation BWRZQLoginPasswordViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self addBackBtn];
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 5.0f;
    [self.loginBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.loginBtn.enabled = NO;
    [self.contentView setFrame:CGRectMake(15, 92 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE - 30, self.contentView.frame.size.height)];
    addShadowToView(self.contentView, 0.3, 5.0f, 5.0f);
    [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 35 - 15, SCREEN_WIDTH_DEVICE, 35)];
    self.bottomInfoLabel = changeLabelAttribute(self.bottomInfoLabel, self.bottomInfoLabel.text.length - 6, 0, [UIColor lightGrayColor], ThemeColor, 0);
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.bottomInfoLabel.text];
    [text addAttribute:NSForegroundColorAttributeName value:ThemeColor range:[self.bottomInfoLabel.text rangeOfString:@"《51赚钱服务协议》"]];
    [text addAttribute:NSForegroundColorAttributeName value:ThemeColor range:[self.bottomInfoLabel.text rangeOfString:@"《51赚钱隐私保护指引》"]];
    self.bottomInfoLabel.attributedText = text;
    [self.bottomInfoLabel yb_addAttributeTapActionWithStrings:@[@"《51赚钱服务协议》",@"《51赚钱隐私保护指引》"] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
        if ([string isEqualToString:@"《51赚钱隐私保护指引》"]) {
            viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/privacyProtocol/index.html", HOSTURL];
        }else{
            viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/serverProtocol/index.html", HOSTURL];
        }
        [self.navigationController pushViewController:viewCon animated:YES];
    }];
}
#pragma mark---uitextfieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.phoneTextField) {
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length > 0) {
            self.phoneInputBool = YES;
        }else if([textField.text stringByReplacingCharactersInRange:range withString:string].length > 11){
            return NO;
        }else{
            self.phoneInputBool = NO;
        }
    }else if (textField == self.passwordTextField){
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length > 0) {
            self.codeInputBool = YES;
        }else{
            self.codeInputBool = NO;
        }
    }
    [self setLoginBtnClick];
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if (textField == self.phoneTextField) {
        self.phoneInputBool = NO;
    }else if (textField == self.passwordTextField){
        self.codeInputBool = NO;
    }
    self.loginBtn.enabled = NO;
    return YES;
}
- (void)setLoginBtnClick{
    if (self.phoneInputBool && self.codeInputBool) {
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
}
- (IBAction)surePress {
    [self.loginBtn setTitle:@"正在登录..." forState:UIControlStateNormal];
    self.loginBtn.userInteractionEnabled = NO;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.phoneTextField.text forKey:@"mobile"];
    [dic setObject:self.passwordTextField.text forKey:@"password"];
    if (self.yaoqingTextField.text.length > 0) {
        [dic setObject:self.yaoqingTextField.text forKey:@"shareCode"];
    }
    [[ServiceRequest sharedService] POST:@"user/login-index" parameters:dic success:^(id responseObject) {
        NSDictionary *contentDic = responseObject;
        NSString *phoneStr = [contentDic objectForKey:@"mobile"];
        NSString *userid = [contentDic objectForKey:@"platformId"];
        [DEFAULTS setObject:responseObject forKey:H5CONTENT];
        [DEFAULTS setObject:userid forKey:USERID];
        [DEFAULTS setObject:phoneStr forKey:@"PHONE"];
        [DEFAULTS synchronize];
        [JPUSHService setAlias:userid completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        } seq:0];
        UserInfo *user = [UserManger currentLoggedInUser];
        if (!user) {
            user = [[UserInfo alloc] init];
        }
        user.userID = userid;
        user.phone = phoneStr;
        user.token = [contentDic objectForKey:@"accessToken"];
        user.name = [contentDic objectForKey:@"userName"];
        user.yaoqingma = [contentDic objectForKey:@"shareCode"];
        [UserManger setUser:user];
        [[LoadConfig shareStance] loadConfigSuccess:^(NSDictionary *dic) {
            [self.loginBtn setTitle:@"登录成功" forState:UIControlStateNormal];
            self.loginBtn.userInteractionEnabled = YES;
            [self dismissViewControllerAnimated:NO completion:^{
                if (self.RefreshHandle) {
                    self.RefreshHandle();
                }
            }];
        } failure:^(NSString *error) {
            [self.loginBtn setTitle:@"重新登录" forState:UIControlStateNormal];
            self.loginBtn.userInteractionEnabled = YES;
            [self showHUDAlert:error];
        }];
    } failure:^(NSString *error, NSInteger code) {
        [self.loginBtn setTitle:@"重新登录" forState:UIControlStateNormal];
        self.loginBtn.userInteractionEnabled = YES;
        [self showHUDAlert:error];
    }];
}
@end
