#import <UIKit/UIKit.h>
#import "BWRZQFaBuPayViewController.h"
#import "Order.h"
#import "RSADataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import "AppMethod.h"
#import "WXApi.h"
#import "GlobalFunction.h"

@interface BWRZQFaBuPayViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)preferredStatusBarStyleLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)getUserAmountLogs:(NSInteger)logs;
+ (BOOL)budikouPressLogs:(NSInteger)logs;
+ (BOOL)dikouPressLogs:(NSInteger)logs;
+ (BOOL)zhifubaoPressLogs:(NSInteger)logs;
+ (BOOL)weixinPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)requestOrderLogs:(NSInteger)logs;
+ (BOOL)doAlipayPayLogs:(NSInteger)logs;
+ (BOOL)paySuccessLogs:(NSInteger)logs;
+ (BOOL)generateTradeNOLogs:(NSInteger)logs;
+ (BOOL)wechatPayClickLogs:(NSInteger)logs;
+ (BOOL)getOrderPayResultLogs:(NSInteger)logs;

@end
