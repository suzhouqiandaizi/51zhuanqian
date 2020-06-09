#import "BWRZQYanzhengShoujiViewController+Logs.h"
@implementation BWRZQYanzhengShoujiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 17 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)codePressLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)getPhoneCodeLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)updateTimeLogs:(NSInteger)logs {
    return logs % 39 == 0;
}

@end
