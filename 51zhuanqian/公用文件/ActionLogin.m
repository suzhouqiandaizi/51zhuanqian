//
//  ActionLogin.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "ActionLogin.h"
#import "WYZQLoginViewController.h"
#import "AppDelegate.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "LoadConfig.h"

@implementation ActionLogin

+(ActionLogin *)shareActionLogin{
    
    static dispatch_once_t pred;
    static ActionLogin *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[ActionLogin alloc]init];
    });
    return shared;
}

- (void)alertActionLogin:(NSString *)infoStr withViewController:(id)viewConEx handle:(void (^)(void))handle{
    NSString *alertStr = @"请登录后体验";
    if (infoStr) {
        alertStr = infoStr;
    }
    
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[[CustomInfoAlertView alloc] initItem:infoStr withTitle:@"提示"]];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消",@"登录", nil]];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        [alertView close];
        if (buttonIndex == 0) {
            
        }else{
            WYZQLoginViewController *viewCon = [[WYZQLoginViewController alloc] initWithNibName:@"WYZQLoginViewController" bundle:nil];
            viewCon.RefreshHandle = ^(){
                handle();
            };
            CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
            navCon.modalPresentationStyle = UIModalPresentationFullScreen;
            [del.navigationController presentViewController:navCon animated:YES completion:nil];
        }
    }];
    
    [alertView setUseMotionEffects:true];
    [del.navigationController.topViewController.view endEditing:YES];
    [alertView show];
}
@end
