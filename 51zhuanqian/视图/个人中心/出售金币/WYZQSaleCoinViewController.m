#import "WYZQSaleCoinViewController.h"
#import "GlobalFunction.h"
#import "WYZQSaleCoinSuccessViewController.h"
@interface WYZQSaleCoinViewController (){
    float rate;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UILabel *jinbiNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *shoudeLabel;
@end
@implementation WYZQSaleCoinViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackBtn];
    self.title = @"出售";
    [self.contentView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    self.contentTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.contentView.hidden = YES;
    [self requestContent];
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/coin-convert", user.userID]];
}
- (void)requestContent{
    [self loadingHUDAlert:@"正在加载"];
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] GET:[NSString stringWithFormat:@"user/%@/coin-convert", user.userID] parameters:nil success:^(id responseObject) {
        self.contentView.hidden = NO;
        [self hideHudAlert];
        self.jinbiNumLabel.text = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"balanceCoinAmount"]];
        self->rate = [[responseObject objectForKey:@"coinConvertRatio"] doubleValue];
        self.shoudeLabel.text = [NSString stringWithFormat:@"1个金币=%.2f元", self->rate];
        user.availableJinbi = [NSString stringWithFormat:@"%@", [responseObject objectForKey:@"balanceCoinAmount"]];
        [UserManger setUser:user];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (IBAction)quanbuchushouPress {
    self.contentTextField.text = self.jinbiNumLabel.text;
    self.shoudeLabel.text = [NSString stringWithFormat:@"%@个金币=%.2f元", self.jinbiNumLabel.text, self->rate * [self.jinbiNumLabel.text integerValue]];
}
- (IBAction)surePress {
    if (self.contentTextField.text.length == 0) {
        [self showHUDAlert:@"请输入出售金币数"];
        return;
    }
    [self loadingHUDAlert:@"正在出售"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:user.userID forKey:@"platformId"];
    [dic setObject:[NSNumber numberWithInteger:[self.contentTextField.text integerValue]] forKey:@"coinAmount"];
    [dic setObject:[NSNumber numberWithDouble:[self.contentTextField.text integerValue] * rate] forKey:@"moneyAmount"];
    [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"user/%@/coin-convert", user.userID] parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        WYZQSaleCoinSuccessViewController *viewCon = [[WYZQSaleCoinSuccessViewController alloc] initWithNibName:@"WYZQSaleCoinSuccessViewController" bundle:nil];
        [self.navigationController pushViewController:viewCon animated:YES];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string length] > 0){
        unichar single = [string characterAtIndex:0];
        if ((single >= '0' && single <= '9') || single == '.')
        {
            if([textField.text length] == 0){
                if(single == '.') {
                    [self showHUDAlert:@"不能输入小数点"];
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
                if (single == '0'){
                    [self showHUDAlert:@"第一个数字不能为0"];
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }
            if (single == '.'){
                [self showHUDAlert:@"不能输入小数点"];
                [textField.text stringByReplacingCharactersInRange:range withString:@""];
                return NO;
            }
        }else{
            [self showHUDAlert:@"您输入的格式不正确"];
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }
    NSString *currentStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if ([currentStr doubleValue] > [self.jinbiNumLabel.text doubleValue]) {
        [self showHUDAlert:@"超出可售金币数"];
        return NO;
    }
    if (currentStr.length > 0) {
        self.shoudeLabel.text = [NSString stringWithFormat:@"%@个金币=%.2f元", currentStr, rate * [currentStr integerValue]];
    }else{
        self.shoudeLabel.text = [NSString stringWithFormat:@"1个金币=%.2f元", rate];
    }
    return YES;
}
@end
