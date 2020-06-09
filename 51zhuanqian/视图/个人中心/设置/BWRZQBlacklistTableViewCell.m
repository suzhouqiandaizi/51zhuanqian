#import "BWRZQBlacklistTableViewCell.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "AppDelegate.h"
@implementation BWRZQBlacklistTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.cancelBtn.layer.masksToBounds = YES;
    self.cancelBtn.layer.cornerRadius = 12.5f;
    self.cancelBtn.layer.borderColor = ThemeColor.CGColor;
    self.cancelBtn.layer.borderWidth = 0.5f;
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.height/2.0;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)cancelPress {
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"是否确定将雇主取消黑名单，取消后将在任务列表重新看到雇主发布的任务" withTitle:@"提示"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"放弃",@"取消黑名单", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
        }else{
            if (self.CancelHandle) {
                self.CancelHandle(self.selectIndex);
            }
        }
    }];
    [alertView setUseMotionEffects:true];
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [del.navigationController.topViewController.view endEditing:YES];
    [alertView show];
}
@end
