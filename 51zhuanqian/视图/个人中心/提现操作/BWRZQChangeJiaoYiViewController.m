#import "BWRZQChangeJiaoYiViewController.h"
@interface BWRZQChangeJiaoYiViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *oneTextField;
@property (weak, nonatomic) IBOutlet UITextField *twoTextField;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIImageView *oneBg;
@property (weak, nonatomic) IBOutlet UIImageView *twoBg;
@end
@implementation BWRZQChangeJiaoYiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置交易密码";
    [self addBackBtn];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 22.0f;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.scrollView.frame.size.height)];
    self.oneBg.layer.masksToBounds = YES;
    self.oneBg.layer.cornerRadius = 22.0f;
    self.twoBg.layer.masksToBounds = YES;
    self.twoBg.layer.cornerRadius = 22.0f;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *stringEx = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (stringEx.length > 6) {
        return NO;
    }else{
        return YES;
    }
}
- (IBAction)surePress {
    if (self.oneTextField.text.length < 6) {
        [self showHUDAlert:@"请输入6位新密码"];
        return;
    }
    if (![self.twoTextField.text isEqualToString:self.oneTextField.text]) {
        [self showHUDAlert:@"密码输入不一致"];
        return;
    }
    [self loadingHUDAlert:@"正在设置"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.oneTextField.text forKey:@"newPassword"];
    [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"user/%@/account/password", user.phone] parameters:dic success:^(id responseObject) {
        [self showHUDAlert:@"设置成功"];
        [UserManger setUser:user];
        [self performSelector:@selector(actionBack) withObject:self afterDelay:2.0f];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
- (void)actionBack{
    if (self.popNumber > 0) {
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count - self.popNumber - 1] animated:YES];
    }else{
        [self goBackAction];
    }
}
@end
