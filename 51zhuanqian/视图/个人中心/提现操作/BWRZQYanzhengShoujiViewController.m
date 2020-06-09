#import "BWRZQYanzhengShoujiViewController.h"
#import "BWRZQChangeJiaoYiViewController.h"
#import "GlobalFunction.h"
@interface BWRZQYanzhengShoujiViewController ()
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *info1Label;
@property (weak, nonatomic) IBOutlet UILabel *info2Label;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSTimer     *timer;
@property (assign, nonatomic) NSInteger   count;
@end
@implementation BWRZQYanzhengShoujiViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手机号";
    [self addBackBtn];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 22.0f;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.scrollView.frame.size.height)];
    UserInfo *user = [UserManger currentLoggedInUser];
    if (self.type == YanzhengShoujiType_default) {
        self.info1Label.text = @"设置交易密码需短信验证，验证码发送至手机：";
    }else{
        self.info1Label.text = @"重置交易密码需短信验证，验证码发送至手机：";
    }
    self.info2Label.text = [NSString stringWithFormat:@"%@, 请按提示操作。", replaceStringWithAsterisk(user.phone, 3, 4)];
}
- (IBAction)surePress {
    if (self.codeTextField.text.length == 0) {
        [self showHUDAlert:@"请输入验证码"];
        return;
    }
    [self loadingHUDAlert:@"正在验证"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.codeTextField.text forKey:@"verifyCode"];
    [dic setObject:user.phone forKey:@"mobile"];
    [[ServiceRequest sharedService] GET:@"user/sms-code" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        BWRZQChangeJiaoYiViewController *viewCon = [[BWRZQChangeJiaoYiViewController alloc] initWithNibName:@"BWRZQChangeJiaoYiViewController" bundle:nil];
        viewCon.popNumber = 2;
        [self.navigationController pushViewController:viewCon animated:YES];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
- (IBAction)codePress {
    [self.codeBtn setTitle:@"正在获取" forState:UIControlStateNormal];
    self.codeBtn.userInteractionEnabled = NO;
    [self getPhoneCode];
}
- (void)getPhoneCode{
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:user.phone forKey:@"mobileNumber"];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/sms", user.phone] parameters:dic success:^(id responseObject) {
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
@end
