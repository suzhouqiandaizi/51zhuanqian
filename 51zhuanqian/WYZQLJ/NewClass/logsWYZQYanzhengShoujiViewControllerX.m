#import "logsWYZQYanzhengShoujiViewControllerX.h"
@implementation logsWYZQYanzhengShoujiViewControllerX
+ (BOOL)ZviewDidLoad:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)psurePress:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)VcodePress:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)SgetPhoneCode:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)CupdateTime:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
