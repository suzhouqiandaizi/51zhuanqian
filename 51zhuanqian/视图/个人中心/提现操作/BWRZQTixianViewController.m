#import "BWRZQTixianViewController.h"
#import "BWRZQTiXianGuangLiViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "BWRZQInputJiaoyiMimaViewController.h"
#import "BWRZQTixianResultViewController.h"
#import "GlobalFunction.h"
#import "BWRZQTixianSuccessViewController.h"
@interface BWRZQTixianViewController ()<UIActionSheetDelegate>{
    NSInteger   tixianType; 
    BOOL        isHaveDian;
    UIButton    *selectBtn;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIImageView *zhifuleixinIcon;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bgTwoImageView;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UIImageView *bgThreeImageView;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (strong, nonatomic) NSTimer     *timer;
@property (assign, nonatomic) NSInteger   count;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UITextField *zhifubaoZhanghuTextField;
@property (weak, nonatomic) IBOutlet UITextField *zhifubaonameTextField;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end
@implementation BWRZQTixianViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [self addBackBtn];
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top)];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    self.bgOneImageView.layer.masksToBounds = YES;
    self.bgOneImageView.layer.cornerRadius = 5.0f;
    self.bgTwoImageView.layer.masksToBounds = YES;
    self.bgTwoImageView.layer.cornerRadius = 5.0f;
    self.bgTwoImageView.layer.masksToBounds = YES;
    self.bgTwoImageView.layer.cornerRadius = 5.0f;
    self.bgThreeImageView.layer.masksToBounds = YES;
    self.bgThreeImageView.layer.cornerRadius = 5.0f;
    tixianType = 1;
    UserInfo *user = [UserManger currentLoggedInUser];
    self.infoLabel.text = [NSString stringWithFormat:@"可提现金额：%.2f元", [user.availableAmount floatValue]];
    self.phoneLabel.text = replaceStringWithAsterisk(user.phone, 3, 4);
    NSString *accountStr = [self.dic objectForKey:@"account"];
    if (accountStr.length > 0) {
        self.zhifubaonameTextField.text = [self.dic objectForKey:@"realName"];
        self.zhifubaoZhanghuTextField.text = accountStr;
    }
    NSArray *sortArr = [self.dic objectForKey:@"withdrawOptions"];
    float originX = 15;
    float originY = 365;
    float btnWidth = (SCREEN_WIDTH_DEVICE - 60)/3;
    float btnHeight = 44;
    for (int i = 0; i < sortArr.count; i++) {
        if (i != 0 && i%3 == 0) {
            originY = originY + 15 + btnHeight;
            originX = 15;
        }
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(originX, originY, btnWidth, btnHeight)];
        originX = originX + btnWidth + 15;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5.0f;
        [btn setTitle:[[sortArr objectAtIndex:i] objectForKey:@"optionDisplay"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [btn setTitleColor:TextColor forState:UIControlStateNormal];
        [btn setBackgroundImage:getColorToImage(LineBackgroundColor) forState:UIControlStateNormal];
        [btn setTitleColor:ThemeColor forState:UIControlStateSelected];
        [btn setBackgroundImage:getColorToImage(RGB(255, 236, 241)) forState:UIControlStateSelected];
        [btn setTitleColor:ThemeColor forState:UIControlStateHighlighted];
        [btn setBackgroundImage:getColorToImage(RGB(255, 236, 241)) forState:UIControlStateHighlighted];
        btn.tag = i;
        [btn addTarget:self action:@selector(selectSort:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:btn];
    }
    [self.bottomView setFrame:CGRectMake(0, originY + btnHeight + 20, SCREEN_WIDTH_DEVICE, self.bottomView.frame.size.height)];
    [self.scrollView setContentSize:CGSizeMake(0, self.bottomView.frame.origin.y + self.bottomView.frame.size.height)];
}
- (void)dealloc{
    UserInfo *user = [UserManger currentLoggedInUser];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/withdraw", user.userID]];
    [[ServiceRequest sharedService] cancelDataTaskForKey:[NSString stringWithFormat:@"user/%@/sms", user.phone]];
}
- (IBAction)tishiPress {
    BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/zhifubaotixiantishi.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (void)selectSort:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (selectBtn != btn) {
        selectBtn.selected = NO;
    }
    btn.selected = YES;
    selectBtn = btn;
}
- (void)tixianguanliPress{
    BWRZQTiXianGuangLiViewController *viewCon = [[BWRZQTiXianGuangLiViewController alloc] initWithNibName:@"BWRZQTiXianGuangLiViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)surePress {
    if (self.zhifubaoZhanghuTextField.text.length == 0) {
        [self showHUDAlert:@"请输入支付宝账号"];
        return;
    }
    if (self.zhifubaonameTextField.text.length == 0) {
        [self showHUDAlert:@"请输入支付宝认证姓名"];
        return;
    }
    if (self.codeTextField.text.length == 0) {
        [self showHUDAlert:@"请输入验证码"];
        return;
    }
    if (!selectBtn) {
        [self showHUDAlert:@"请选择提现金额"];
        return;
    }
    [self loadingHUDAlert:@"正在提现"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.zhifubaoZhanghuTextField.text forKey:@"channelAccount"];
    [dic setObject:self.zhifubaonameTextField.text forKey:@"realName"];
    [dic setObject:self.codeTextField.text forKey:@"verifyCode"];
    NSArray *sortArr = [self.dic objectForKey:@"withdrawOptions"];
    [dic setObject:[NSNumber numberWithFloat:[[[sortArr objectAtIndex:selectBtn.tag] objectForKey:@"optionValue"] floatValue]] forKey:@"withdrawAmount"];
    [[ServiceRequest sharedService] POSTJSON:[NSString stringWithFormat:@"user/%@/withdraw", user.userID] parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        BWRZQTixianSuccessViewController *viewCon = [[BWRZQTixianSuccessViewController alloc] initWithNibName:@"BWRZQTixianSuccessViewController" bundle:nil];
        [self.navigationController pushViewController:viewCon animated:YES];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];    
}
- (IBAction)codePress {
    [self.codeBtn setTitle:@"正在获取" forState:UIControlStateNormal];
    self.codeBtn.userInteractionEnabled = NO;
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
- (IBAction)changePress {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"请选择提现方式"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"支付宝", @"微信",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        tixianType = 1;
        self.zhifuleixinIcon.image = [UIImage imageNamed:@"wode_goumai_zhifubao_icon"];
    }else if (buttonIndex == 1){
        tixianType = 2;
        self.zhifuleixinIcon.image = [UIImage imageNamed:@"wode_goumai_weixin_icon"];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([textField.text rangeOfString:@"."].location == NSNotFound)
    {
        isHaveDian = NO;
    }
    if ([string length] > 0)
    {
        unichar single = [string characterAtIndex:0];
        if ((single >= '0' && single <= '9') || single == '.')
        {
            if([textField.text length] == 0){
                if(single == '.') {
                    [self showHUDAlert:@"第一个数字不能为小数点"];
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
                if(!isHaveDian){
                    isHaveDian = YES;
                    return YES;
                }else{
                    [self showHUDAlert:@"您已经输入过小数点了"];
                    [textField.text stringByReplacingCharactersInRange:range withString:@""];
                    return NO;
                }
            }else{
                if (isHaveDian) {
                    NSRange ran = [textField.text rangeOfString:@"."];
                    if (range.location - ran.location <= 2) {
                        return YES;
                    }else{
                        [self showHUDAlert:@"您最多只能输入两位小数"];
                        return NO;
                    }
                }else{
                    return YES;
                }
            }
        }else{
            [self showHUDAlert:@"您输入的格式不正确"];
            [textField.text stringByReplacingCharactersInRange:range withString:@""];
            return NO;
        }
    }else{
        return YES;
    }
}
@end
