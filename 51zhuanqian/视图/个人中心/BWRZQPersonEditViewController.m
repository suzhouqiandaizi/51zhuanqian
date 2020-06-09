#import "BWRZQPersonEditViewController.h"
@interface BWRZQPersonEditViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@end
@implementation BWRZQPersonEditViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置昵称";
    [((UIButton *)[self addLeftBtn:@"取消"]) addTarget:self action:@selector(cancelPress) forControlEvents:UIControlEventTouchUpInside];
    [((UIButton *)[self addRigthBtn:@"完成"]) addTarget:self action:@selector(finishPress) forControlEvents:UIControlEventTouchUpInside];
    [self.topView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.topView.frame.size.height)];
    self.contentTextField.text = self.nameStr;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.contentTextField becomeFirstResponder];
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@", user.userID]];
}
- (void)cancelPress{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)finishPress{
    if (self.contentTextField.text.length == 0) {
        [self showHUDAlert:@"昵称不能为空"];
        return;
    }
    [self loadingHUDAlert:@"正在保存"];
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] PUTJSON:[NSString stringWithFormat:@"user/%@", user.userID] parameters:@{@"nickName":self.contentTextField.text} success:^(id responseObject) {
        [self hideHudAlert];
        user.nickname = self.contentTextField.text;
        [UserManger setUser:user];
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.RefreshHandle) {
                self.RefreshHandle(self.contentTextField.text);
            }
            [self.view endEditing:YES];
        }];
    } failure:^(NSString *error, NSInteger code) {
        [self showHUDAlert:error];
    }];
}
@end
