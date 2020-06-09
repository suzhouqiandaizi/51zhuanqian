#import "AppMethod+Logs.h"
@implementation AppMethod (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)getRandomStringLogs:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)deviceIPAdressLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)partnerSignOrderLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)signStringLogs:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
