#import "WYZQRegisterViewController+Logs.h"
@implementation WYZQRegisterViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)codePressLogs:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)getPhoneCodeLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)nextActionLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)updateTimeLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)textFieldShouldchangecharactersinrangeReplacementstringLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)textFieldShouldClearLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)setVerificationCodeBtnClickLogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)showServerProtocolPressLogs:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
