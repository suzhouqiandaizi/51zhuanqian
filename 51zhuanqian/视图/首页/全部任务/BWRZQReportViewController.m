#import "BWRZQReportViewController.h"
#import "GlobalFunction.h"
#import "BWRZQLoginViewController.h"
#import "CustomIOSAlertView.h"
#import "CustomSuccessAlertView.h"
@interface BWRZQReportViewController ()<UIGestureRecognizerDelegate>{
    BOOL        editBool;
}
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UITextView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *wordNumLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@end
@implementation BWRZQReportViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"投诉举报";
    [self addBackBtn];
    self.backgroundView.layer.masksToBounds = YES;
    self.backgroundView.layer.cornerRadius = 5.0f;
    self.backgroundView.layer.borderWidth = 0.5f;
    self.backgroundView.layer.borderColor = [LineColor CGColor];
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 5.0f;
    [self.sureBtn setBackgroundImage:getColorToImage(ThemeColor) forState:UIControlStateNormal];
    editBool = YES;
    self.contentView.textColor = PlaceholderColor;
    [self.bgView setFrame:CGRectMake(0, 74 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, 285)];
}
- (void)dealloc{
    [[ServiceRequest sharedService] cancelDataTaskForKey:@"configuration/complain"];
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (editBool) {
        editBool = NO;
        textView.text = @"";
        [textView setTextColor:TextColor];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        editBool = YES;
        textView.text = @"请输入您的投诉举报内容，我们将第一时间处理。";
        [textView setTextColor:PlaceholderColor];
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSInteger textViewLength = [textView.text stringByReplacingCharactersInRange:range withString:text].length;
    if (textViewLength > 200) {
        return NO;
    }else if (textViewLength == 0){
        self.wordNumLabel.text = [NSString stringWithFormat:@"%ld/200", (long)textViewLength];
        return YES;
    }else if (textViewLength > 0){
        self.wordNumLabel.text = [NSString stringWithFormat:@"%ld/200", (long)textViewLength];
        return YES;
    }else{
        return YES;
    }
}
- (void)textViewDidChange:(UITextView *)textView{
    [textView setTextColor:TextColor];
}
- (IBAction)sendPress {
    if (self.contentView.text.length == 0 || [self.contentView.text isEqualToString:@"请输入您的投诉举报内容，我们将第一时间处理。"]) {
        [self showHUDAlert:@"请输入内容"];
        return;
    }
    [self loadingHUDAlert:@"正在发送"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:self.contentView.text forKey:@"content"];
    [dic setObject:self.taskId forKey:@"taskNo"];
    [[ServiceRequest sharedService] POST:@"configuration/complain" parameters:dic success:^(id responseObject) {
        [self hideHudAlert];
        CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
        [alertView setContainerView:[[CustomSuccessAlertView alloc] initItem:@"已收到您的投诉举报！"]];
        [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"知道了", nil]];
        [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
            [alertView close];
            [self goBackAction];
        }];
        [alertView setUseMotionEffects:true];
        [self.view endEditing:YES];
        [alertView show];
    } failure:^(NSString *error, NSInteger code) {
        [self hideHudAlert];
        [self showHUDAlert:error];
    }];
}
@end
