#import "WYZQTixianAgainViewController.h"
#import "WYZQTiXianGuangLiViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "WYZQInputJiaoyiMimaViewController.h"
#import "WYZQTixianResultViewController.h"
#import "GlobalFunction.h"
#import "WYZQTixianSuccessViewController.h"
#import "WYZQTixianViewController.h"
@interface WYZQTixianAgainViewController ()<UIActionSheetDelegate>{
    NSInteger   tixianType; 
    BOOL        isHaveDian;
    UIButton    *selectBtn;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIImageView *zhifuleixinIcon;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhanghuInfoLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end
@implementation WYZQTixianAgainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提现";
    [self addBackBtn];
    self.scrollView.alwaysBounceVertical = YES;
    [self.scrollView setFrame:CGRectMake(0, 64 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE - 64 - IS_iPhoneX_Top)];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    tixianType = 1;
    self.zhanghuInfoLabel.text = [self.dic objectForKey:@"account"];
    UserInfo *user = [UserManger currentLoggedInUser];
    self.infoLabel.text = [NSString stringWithFormat:@"可提现金额：%.2f元", [user.availableAmount floatValue]];
    NSArray *sortArr = [self.dic objectForKey:@"withdrawOptions"];
    float originX = 15;
    float originY = 100;
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
- (void)selectSort:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (selectBtn != btn) {
        selectBtn.selected = NO;
    }
    btn.selected = YES;
    selectBtn = btn;
}
- (void)tixianguanliPress{
    WYZQTiXianGuangLiViewController *viewCon = [[WYZQTiXianGuangLiViewController alloc] initWithNibName:@"WYZQTiXianGuangLiViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)editPress {
    WYZQTixianViewController *viewCon = [[WYZQTixianViewController alloc] initWithNibName:@"WYZQTixianViewController" bundle:nil];
    viewCon.dic = self.dic;
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)surePress {
    if (!selectBtn) {
        [self showHUDAlert:@"请选择提现金额"];
        return;
    }
    [self loadingHUDAlert:@"正在提现"];
    UserInfo *user = [UserManger currentLoggedInUser];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:user.userID forKey:@"platformId"];
    NSArray *sortArr = [self.dic objectForKey:@"withdrawOptions"];
    [dic setObject:[NSNumber numberWithFloat:[[[sortArr objectAtIndex:selectBtn.tag] objectForKey:@"optionValue"] floatValue]] forKey:@"withdrawAmount"];
    [[ServiceRequest sharedService] POST:[NSString stringWithFormat:@"user/%@/withdraw-without-accountinfo", user.userID] parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        WYZQTixianSuccessViewController *viewCon = [[WYZQTixianSuccessViewController alloc] initWithNibName:@"WYZQTixianSuccessViewController" bundle:nil];
        [self.navigationController pushViewController:viewCon animated:YES];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];    
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
