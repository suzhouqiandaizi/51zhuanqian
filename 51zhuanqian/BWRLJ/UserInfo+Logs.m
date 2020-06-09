#import "UserInfo+Logs.h"
@implementation UserInfo (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)encodeWithCoderLogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)initWithCoderLogs:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
