#import "logsBWRZQXinShouViewControllerm.h"
@implementation logsBWRZQXinShouViewControllerm
+ (BOOL)bViewdidloadlogs:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)yPrepareforseguesenderlogs:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
