#import "logsUIViewc.h"
@implementation logsUIViewc
+ (BOOL)hSetsettingrecroder:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)QsettingRecroder:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
