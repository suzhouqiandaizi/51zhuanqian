#import "BWRZQLoginViewController.h"
#import "JPUSHService.h"
#import "SharedViewControllers.h"
#import "GlobalFunction.h"
#import "BWRZQHomeViewController.h"
#import "BWRZQLoginAlertView.h"
#import "BWRZQLoginPrivacyProtocolView.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "LoadConfig.h"
#import "BWRZQLoginPasswordViewController.h"
#import <TJSDK/TJSDK.h>
@interface BWRZQLoginViewController ()<UINavigationControllerDelegate>{
    BOOL    hasLogin;
}
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *yaoqingTextField;
@property (strong, nonatomic) NSTimer     *timer;
@property (assign, nonatomic) NSInteger   count;
@property (assign, nonatomic) BOOL        phoneInputBool;
@property (assign, nonatomic) BOOL        codeInputBool;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *bottomInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *qiehuanBtn;
@end
@implementation BWRZQLoginViewController
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    self.fd_prefersNavigationBarHidden = YES;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 5.0f;
    [self.loginBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.loginBtn.enabled = NO;
    hasLogin = NO;
    [self.bgImageView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 175 + IS_iPhoneX_Top)];
    [self.contentView setFrame:CGRectMake(15, 92 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE - 30, self.contentView.frame.size.height)];
    addShadowToView(self.contentView, 0.3, 5.0f, 5.0f);
    NSString *phoneStr = [DEFAULTS objectForKey:@"PHONE"];
    if (phoneStr.length > 0) {
        self.phoneTextField.text = phoneStr;
        self.phoneInputBool = YES;
    }
    [self.bottomView setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 35 - 15, SCREEN_WIDTH_DEVICE, 35)];
    self.bottomInfoLabel = changeLabelAttribute(self.bottomInfoLabel, self.bottomInfoLabel.text.length - 6, 0, [UIColor lightGrayColor], ThemeColor, 0);
    if (![DEFAULTS boolForKey:@"SHOWPRIVACYPROTOCOL"]) {
        BWRZQLoginPrivacyProtocolView *alertView = [[BWRZQLoginPrivacyProtocolView alloc] initItem];
        alertView.ClikcHandle = ^(NSString * _Nonnull url) {
            BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
            viewCon.urlStr = url;
            [self.navigationController pushViewController:viewCon animated:YES];
        };
        [self.view addSubview:alertView];
    }
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
    if ([[[[LoadConfig shareStance] getConfig] objectForKey:@"releaseTask"] isEqualToString:@"NO"]) {
        self.qiehuanBtn.hidden = NO;
    }else{
        self.qiehuanBtn.hidden = YES;
    }
    UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(qiehuanGesture:)];
    [self.loginLabel addGestureRecognizer:longTap];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (hasLogin) {
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        self.loginBtn.userInteractionEnabled = YES;
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.delegate == self){
        self.navigationController.delegate = nil;
    }
}
- (void)dealloc {
    self.navigationController.delegate = nil;
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"user"];
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/sms", user.phone]];
}
- (IBAction)loginPress {
    [self.loginBtn setTitle:@"正在登录..." forState:UIControlStateNormal];
    self.loginBtn.userInteractionEnabled = NO;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.phoneTextField.text forKey:@"mobile"];
    [dic setObject:self.codeTextField.text forKey:@"verifyCode"];
    if (self.yaoqingTextField.text.length > 0) {
        [dic setObject:self.yaoqingTextField.text forKey:@"shareCode"];
    }
    [[ServiceRequest sharedService] POSTJSON:@"user" parameters:dic success:^(id responseObject) {
        NSDictionary *contentDic = responseObject;
        NSString *phoneStr = [contentDic objectForKey:@"mobile"];
        NSString *userid = [contentDic objectForKey:@"platformId"];
        [DEFAULTS setObject:responseObject forKey:H5CONTENT];
        [DEFAULTS setObject:userid forKey:USERID];
        [DEFAULTS setObject:phoneStr forKey:@"PHONE"];
        [DEFAULTS synchronize];
        [JPUSHService setAlias:userid completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
        } seq:0];
        [TJSDK setAppUserId:userid];
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
            self->hasLogin = YES;
            [self.loginBtn setTitle:@"登录成功" forState:UIControlStateNormal];
            self.loginBtn.userInteractionEnabled = YES;
            [self dismissViewControllerAnimated:NO completion:^{
                if (self.RefreshHandle) {
                    self.RefreshHandle();
                }
            }];
        } failure:^(NSString *error) {
            self->hasLogin = NO;
            [self.loginBtn setTitle:@"重新登录" forState:UIControlStateNormal];
            self.loginBtn.userInteractionEnabled = YES;
            [self showHUDAlert:error];
        }];
    } failure:^(NSString *error, NSInteger code) {
        self->hasLogin = NO;
        [self.loginBtn setTitle:@"重新登录" forState:UIControlStateNormal];
        self.loginBtn.userInteractionEnabled = YES;
        [self showHUDAlert:error];
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
    }else if (textField == self.codeTextField){
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
    }else if (textField == self.codeTextField){
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
- (IBAction)codePress {
    [self.codeBtn setTitle:@"正在获取" forState:UIControlStateNormal];
    self.codeBtn.userInteractionEnabled = NO;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.phoneTextField.text forKey:@"mobileNumber"];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/sms", self.phoneTextField.text] parameters:dic success:^(id responseObject) {
        self.count = 60;
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(updateTime)
                                               userInfo:nil
                                                repeats:YES];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
        [self.codeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        self.codeBtn.userInteractionEnabled = YES;
    }];
}
#pragma mark 更新时间
-(void)updateTime
{
    self.count--;
    if (self.count > 0) {
        [self.codeBtn setTitle:[NSString stringWithFormat:@"已发送(%ld)",(long)self.count] forState:UIControlStateNormal];
        self.codeBtn.userInteractionEnabled = NO;
        return;
    }
    else{
        self.codeBtn.userInteractionEnabled = YES;
        [self.codeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (IBAction)yonghuxieyiPress {
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/serverProtocol/index.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)meishoudaoyanzhengmaPress {
    BWRZQLoginAlertView *alertView = [[BWRZQLoginAlertView alloc] initItem];
    [self.view.window addSubview:alertView];
}
- (IBAction)qiehuanPress {
    BWRZQLoginPasswordViewController *viewCon = [[BWRZQLoginPasswordViewController alloc] initWithNibName:@"BWRZQLoginPasswordViewController" bundle:nil];
    viewCon.RefreshHandle = ^{
        if (self.RefreshHandle) {
            self.RefreshHandle();
        }
    };
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)qiehuanGesture:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        [self qiehuanPress];
    }else{
    }
}
@end
