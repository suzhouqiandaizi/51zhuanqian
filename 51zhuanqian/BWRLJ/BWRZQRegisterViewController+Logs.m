#import "BWRZQRegisterViewController+Logs.h"
@implementation BWRZQRegisterViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)codePressLogs:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)getPhoneCodeLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)nextActionLogs:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)updateTimeLogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)textFieldShouldClearLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)setVerificationCodeBtnClickLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)showServerProtocolPressLogs:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
