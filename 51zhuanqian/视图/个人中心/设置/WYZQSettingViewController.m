#import "WYZQSettingViewController.h"
#import "CustomInfoAlertView.h"
#import "CustomIOSAlertView.h"
#import "WYZQAboutViewController.h"
#import "WYZQFeedBackViewController.h"
#import "WYZQBlacklistViewController.h"
#import "UIAlertView+Blocks.h"
#import <StoreKit/StoreKit.h>
#import "UpdateAlertView.h"
#import "WYZQLoginViewController.h"
#import "SharedViewControllers.h"
#import "WYZQHomeViewController.h"
@interface WYZQSettingViewController ()<SKStoreProductViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UILabel *cacheLabel;
@property (weak, nonatomic) IBOutlet UIButton *quitBtn;
@end
@implementation WYZQSettingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self addBackBtn];
    [self.contentView setFrame:CGRectMake(0, 84 + IS_iPhoneX_Top, SCREEN_WIDTH_DEVICE, self.contentView.frame.size.height)];
    [self.quitBtn setFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - IS_iPhoneX_Bottom - 20 - 44, SCREEN_WIDTH_DEVICE, 44)];
    self.cacheLabel.text = [NSString stringWithFormat:@"%.2fM", (unsigned long)[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0];
}
- (IBAction)logoutPress {
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:@"是否要退出当前账号？" withTitle:@"提示"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"退出", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
        }else{
            [UserManger logoutCurrentUser];
            if (self.RefreshHandle) {
                self.RefreshHandle();
            }
            WYZQLoginViewController *viewCon = [[WYZQLoginViewController alloc] initWithNibName:@"WYZQLoginViewController" bundle:nil];
            viewCon.RefreshHandle = ^{
                [self.navigationController popToRootViewControllerAnimated:YES];
                [[SharedViewControllers homeViewCon] refreshViewCon];
            };
            CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
            navCon.modalPresentationStyle = UIModalPresentationFullScreen;
            [self.navigationController presentViewController:navCon animated:YES completion:nil];
        }
    }];
    [alertView setUseMotionEffects:true];
    [self.view endEditing:YES];
    [alertView show];
}
- (IBAction)cleanPress {
    [self showHUDAlert:@"清除成功"];
    self.cacheLabel.text = @"0M";
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
}
- (IBAction)feedbackPress {
    WYZQFeedBackViewController *viewCon = [[WYZQFeedBackViewController alloc] initWithNibName:@"WYZQFeedBackViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)aboutPress {
    WYZQAboutViewController *viewCon = [[WYZQAboutViewController alloc] initWithNibName:@"WYZQAboutViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)questionsPress {
    WYZQWebShowViewController *viewCon = [[WYZQWebShowViewController alloc] initWithNibName:@"WYZQWebShowViewController" bundle:nil];
    viewCon.urlStr = [NSString stringWithFormat:@"%@/app_51zhuanqian/questions.html", HOSTURL];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)heimingdanPress {
    WYZQBlacklistViewController *viewCon = [[WYZQBlacklistViewController alloc] initWithNibName:@"WYZQBlacklistViewController" bundle:nil];
    [self.navigationController pushViewController:viewCon animated:YES];
}
- (IBAction)updatePress {
    [[ServiceRequest sharedService] GET:@"configuration/config-data" parameters:@{@"dataUrl":[NSString stringWithFormat:@"%@%@", HOSTURL, @"/app_51zhuanqian/ios.json"]} success:^(NSDictionary *responseObject) {
           NSString *version = [responseObject objectForKey:@"version"];
           if (![version isEqualToString:[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]] && [[responseObject objectForKey:@"examine"] isEqualToString:@"NO"]) {
               UpdateAlertView *alertView = [[UpdateAlertView alloc] initItem:responseObject];
               [self.view.window addSubview:alertView];
           }else{
               [self showHUDAlert:@"已是最新版本"];
           }
       } failure:^(NSString *error, NSInteger code) {
       }];
}
- (IBAction)haopingPress {
    [self showHUDAlert:@"正在跳转"];
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    storeProductViewContorller.delegate = self;
    [storeProductViewContorller loadProductWithParameters:
     @{SKStoreProductParameterITunesItemIdentifier:APPLEID} completionBlock:^(BOOL result, NSError *error) {
         [self hideHudAlert];
         if(error){
             NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
             [self showHUDAlert:@"发生错误，请重试"];
         }else{
             [self.navigationController presentViewController:storeProductViewContorller animated:YES completion:^{
             }];
         }
     }];
}
@end
