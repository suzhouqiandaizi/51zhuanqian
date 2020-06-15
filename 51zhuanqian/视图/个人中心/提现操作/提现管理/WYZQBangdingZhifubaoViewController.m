#import "WYZQBangdingZhifubaoViewController.h"
@interface WYZQBangdingZhifubaoViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITextField *oneTextField;
@property (weak, nonatomic) IBOutlet UITextField *twoTextField;
@end
@implementation WYZQBangdingZhifubaoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isChange) {
        self.title = @"修改支付宝账户";
        [self.sureBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    }else{
        self.title = @"绑定支付宝账户";
        [self.sureBtn setTitle:@"确认绑定" forState:UIControlStateNormal];
    }
    [self addBackBtn];
    [self.contentView setFrame:CGRectMake(0, 84 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    [self.sureBtn setFrame:CGRectMake(15, self.contentView.frame.origin.y + self.contentView.frame.size.height + 30, SCREEN_WIDTH_DEVICE - 30, 44)];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 22.0f;
}
- (IBAction)surePress {
    if (self.oneTextField.text.length == 0) {
        [self showHUDAlert:@"请输入真实姓名"];
        return;
    }
    if (self.twoTextField.text.length == 0) {
        [self showHUDAlert:@"请输入支付宝账户"];
        return;
    }
    [self loadingHUDAlert:@"正在绑定"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.oneTextField.text forKey:@"userName"];
    [dic setObject:self.twoTextField.text forKey:@"aliPayAccount"];
    [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"user/%@", user.phone] parameters:dic success:^(id responseObject) {
        [self showHUDAlert:@"绑定成功"];
        [UserManger setUser:user];
        [self performSelector:@selector(goBackAction) withObject:self afterDelay:2.0f];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
@end
