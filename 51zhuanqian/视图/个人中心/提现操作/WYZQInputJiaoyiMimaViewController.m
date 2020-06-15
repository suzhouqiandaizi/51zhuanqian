#import "WYZQInputJiaoyiMimaViewController.h"
#import "SHPasswordTextView.h"
#import "WYZQYanzhengShoujiViewController.h"
@interface WYZQInputJiaoyiMimaViewController ()
@property (nonatomic, strong) SHPasswordTextView *passwordTextView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end
@implementation WYZQInputJiaoyiMimaViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证交易密码";
    [self addBackBtn];
    [self.scrollView setFrame:CGRectMake(0, 104 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 145)];
    _passwordTextView = [[SHPasswordTextView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 50) count:6 margin:0.00001 passwordFont:50 forType:SHPasswordTextTypeRectangle block:^(NSString * _Nonnull passwordStr) {
        NSLog(@"shihu___passwordStr == %@",passwordStr);
        UserInfo *user = [UserManger currentLoggedInUser];
        [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/withdraw/%@", user.phone, passwordStr] parameters:nil success:^(id responseObject) {
            [self dismissViewControllerAnimated:YES completion:^{
                if (self.RefreshHandle) {
                    self.RefreshHandle(@"success");
                }
            }];
        } failure:^(NSString *error, NSInteger code) {
            [self showHUDAlert:error];
        }];
    }];
    _passwordTextView.passwordSecureEntry = YES;
    [_passwordTextView.textField becomeFirstResponder];
    [self.contentView addSubview:_passwordTextView];
    self.contentView.layer.masksToBounds = YES;
    self.contentView.layer.cornerRadius = 5.0f;
    self.contentView.layer.borderColor = TextGrayColor.CGColor;
    self.contentView.layer.borderWidth = 0.5f;
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(50, 0, 0.5, 50)];
    [line1 setBackgroundColor:TextGrayColor];
    [self.contentView addSubview:line1];
    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 0.5, 50)];
    [line2 setBackgroundColor:TextGrayColor];
    [self.contentView addSubview:line2];
    UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(150, 0, 0.5, 50)];
    [line3 setBackgroundColor:TextGrayColor];
    [self.contentView addSubview:line3];
    UIImageView *line4 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 0, 0.5, 50)];
    [line4 setBackgroundColor:TextGrayColor];
    [self.contentView addSubview:line4];
    UIImageView *line5 = [[UIImageView alloc] initWithFrame:CGRectMake(250, 0, 0.5, 50)];
    [line5 setBackgroundColor:TextGrayColor];
    [self.contentView addSubview:line5];
}
- (void)cancelTap{
    [self.passwordTextView endEditing:YES];
}
- (IBAction)wangjimimaPress {
    WYZQYanzhengShoujiViewController *viewCon = [[WYZQYanzhengShoujiViewController alloc] initWithNibName:@"WYZQYanzhengShoujiViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end
