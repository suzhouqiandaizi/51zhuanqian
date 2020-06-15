#import <UIKit/UIKit.h>
#import "WYZQYanzhengShoujiViewController.h"
#import "WYZQChangeJiaoYiViewController.h"
#import "GlobalFunction.h"

@interface WYZQYanzhengShoujiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)codePressLogs:(NSInteger)logs;
+ (BOOL)getPhoneCodeLogs:(NSInteger)logs;
+ (BOOL)updateTimeLogs:(NSInteger)logs;

@end
