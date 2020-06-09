#import "logsBWRZQYanzhengShoujiViewControllere.h"
@implementation logsBWRZQYanzhengShoujiViewControllere
+ (BOOL)YviewDidLoad:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)LsurePress:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)ccodePress:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)ngetPhoneCode:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)rupdateTime:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
