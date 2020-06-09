#import "BWRZQRegisterViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomSuccessAlertView.h"
#import "BWRZQLoginViewController.h"
#import "AppDelegate.h"
#import "SharedViewControllers.h"
#import "BWRZQPersonViewController.h"
@interface BWRZQRegisterViewController (){
    BOOL        phoneInputBool;
    BOOL        codeInputBool;
    BOOL        onePasswordInputBool;
    BOOL        twoPasswordInputBool;
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UITextField *onePasswordTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *twoPasswordTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *xieyiBtn;
@property (strong, nonatomic) NSTimer     *timer;
@property (assign, nonatomic) NSInteger   count;
@end
@implementation BWRZQRegisterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self addBackBtn];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 22.0f;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.scrollView.frame.size.height)];
    self.sureBtn.enabled = NO;
    self.codeBtn.enabled = NO;
    phoneInputBool = NO;
    codeInputBool = NO;
    onePasswordInputBool = NO;
    twoPasswordInputBool = NO;
    if (self.type == RegisterType_change) {
        self.title = @"修改登录密码";
        UserInfo *user = [UserManger currentLoggedInUser];
        self.phoneTextField.text = user.phone;
        [self.sureBtn setTitle:@"确定修改" forState:UIControlStateNormal];
        phoneInputBool = YES;
        self.phoneTextField.enabled = NO;
        self.codeBtn.enabled = YES;
        self.codeBtn.userInteractionEnabled = YES;
        self.titleLabel.text = @"感谢使用！";
    }else if (self.type == RegisterType_forgot){
        self.title = @"忘记密码";
        [self.sureBtn setTitle:@"确定修改" forState:UIControlStateNormal];
        self.titleLabel.text = @"感谢使用！";
    }else{
        self.title = @"注册";
        [self.sureBtn setTitle:@"同意协议并注册" forState:UIControlStateNormal];
        self.xieyiBtn.hidden = NO;
        self.titleLabel.text = @"欢迎注册！";
    }
}
- (IBAction)codePress {
    [self.codeBtn setTitle:@"正在获取" forState:UIControlStateNormal];
    self.codeBtn.userInteractionEnabled = NO;
    if (self.type == RegisterType_default) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:self.phoneTextField.text forKey:@"mobileNumber"];
        [[ServiceRequest sharedService] GET:@"user/existence" parameters:dic success:^(id responseObject) {
            self.codeBtn.userInteractionEnabled = YES;
            [self showHUDAlert:@"手机号已经被注册"];
            [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        } failure:^(NSString *error, NSInteger code) {
            if (code == 404) {
                [self getPhoneCode];
            }else if (code == 409) {
                self.codeBtn.userInteractionEnabled = YES;
                [self showHUDAlert:@"手机号已经被注册"];
                [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            }else{
                self.codeBtn.userInteractionEnabled = YES;
                [self showHUDAlert:error];
                [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            }
        }];
    }else if (self.type == RegisterType_forgot){
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:self.phoneTextField.text forKey:@"mobileNumber"];
        [[ServiceRequest sharedService] GET:@"user/existence" parameters:dic success:^(id responseObject) {
            NSLog(@"aa");
            [self getPhoneCode];
        } failure:^(NSString *error, NSInteger code) {
            if (code == 404) {
                [self showHUDAlert:@"该手机号未被注册"];
                self.codeBtn.userInteractionEnabled = YES;
                [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            }else if (code == 409) {
                [self getPhoneCode];
            }else{
                self.codeBtn.userInteractionEnabled = YES;
                [self showHUDAlert:error];
                [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
            }
        }];
    }else{
        [self getPhoneCode];
    }
}
- (void)getPhoneCode{
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
- (IBAction)surePress {
    if (self.onePasswordTextFiled.text.length < 6 || self.twoPasswordTextFiled.text.length < 6) {
        [self showHUDAlert:@"密码至少输入6位数"];
        return;
    }
    if (![self.onePasswordTextFiled.text isEqualToString:self.twoPasswordTextFiled.text]) {
        [self showHUDAlert:@"密码输入不一致"];
        return;
    }
    [self loadingHUDAlert:@"正在处理"];
    [self nextAction];
}
- (void)nextAction{
    self.count = 60;
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    [self.codeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
    self.codeBtn.userInteractionEnabled = YES;
    if (self.type == RegisterType_default) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:self.phoneTextField.text forKey:@"mobile"];
        [dic setObject:self.codeTextField.text forKey:@"verifyCode"];
        [dic setObject:self.onePasswordTextFiled.text forKey:@"password"];
        [[ServiceRequest sharedService] POSTJSON:@"user" parameters:dic success:^(id responseObject) {
            [self showHUDAlert:@"注册成功"];
            if (self.RefreshPhone) {
                self.RefreshPhone(self.phoneTextField.text);
            }
            [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
        } failure:^(NSString *error, NSInteger code) {
            if (code == 409) {
                [self showHUDAlert:@"您注册的用户已存在"];
            }else{
                [self showHUDAlert:error];
            }
        }];
    }else{
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:self.codeTextField.text forKey:@"verifyCode"];
        [dic setObject:self.onePasswordTextFiled.text forKey:@"newPassword"];
        [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"user/%@/password", self.phoneTextField.text] parameters:dic success:^(id responseObject) {
            if (self.type == RegisterType_change) {
                [self hideHudAlert];
                [self.view endEditing:YES];
                [UserManger logoutCurrentUser];
                [[SharedViewControllers personViewCon] showContentView];
                CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
                [alertView removeBackgroundViewTap];
                [alertView setContainerView:[[CustomSuccessAlertView alloc] initItem:@"密码修改成功，请重新登录"]];
                [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"重新登录", nil]];
                [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
                    [alertView close];
                    [self.navigationController popToRootViewControllerAnimated:NO];
                    BWRZQLoginViewController *viewCon = [[BWRZQLoginViewController alloc] initWithNibName:@"BWRZQLoginViewController" bundle:nil];
                    viewCon.RefreshHandle = ^(){
                    };
                    CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
                    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
                    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                    [del.navigationController presentViewController:navCon animated:YES completion:nil];
                }];
                [alertView setUseMotionEffects:true];
                [alertView show];
            }else{
                [self showHUDAlert:@"修改密码成功"];
                [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
            }
        } failure:^(NSString *error, NSInteger code) {
            if (self.type == RegisterType_forgot) {
                if (code == 404 || code == 400) {
                    [self showHUDAlert:@"当前用户不存在"];
                }else{
                    [self showHUDAlert:error];
                }
            }else if (self.type == RegisterType_change){
                [self showHUDAlert:error];
            }else{
                [self showHUDAlert:error];
            }
        }];
    }
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
#pragma mark---uitextfieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.phoneTextField) {
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length == 11) {
            self.codeBtn.enabled = YES;
            phoneInputBool = YES;
        }else if([textField.text stringByReplacingCharactersInRange:range withString:string].length > 11){
            return NO;
        }else{
            self.codeBtn.enabled = NO;
            phoneInputBool = NO;
        }
    }else if (textField == self.codeTextField){
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length > 0) {
            codeInputBool = YES;
        }else{
            codeInputBool = NO;
        }
    }else if (textField == self.onePasswordTextFiled){
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length > 0) {
            onePasswordInputBool = YES;
        }else{
            onePasswordInputBool = NO;
        }
    }else if (textField == self.twoPasswordTextFiled){
        if ([textField.text stringByReplacingCharactersInRange:range withString:string].length > 0) {
            twoPasswordInputBool = YES;
        }else{
            twoPasswordInputBool = NO;
        }
    }
    [self setVerificationCodeBtnClick];
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if (textField == self.phoneTextField) {
        self.codeBtn.enabled = NO;
        phoneInputBool = NO;
        [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    self.sureBtn.enabled = NO;
    return YES;
}
- (void)setVerificationCodeBtnClick{
    if (phoneInputBool && codeInputBool && onePasswordInputBool && twoPasswordInputBool) {
        self.sureBtn.enabled = YES;
    }else{
        self.sureBtn.enabled = NO;
    }
}
- (IBAction)showServerProtocolPress {
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/agreement/index.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
