#import "WYZQYanzhengShoujiViewController+Logs.h"
@implementation WYZQYanzhengShoujiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)codePressLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)getPhoneCodeLogs:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)updateTimeLogs:(NSInteger)logs {
    return logs % 47 == 0;
}

@end
