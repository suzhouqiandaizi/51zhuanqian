#import "LaunchAdModel+Logs.h"
@implementation LaunchAdModel (Logs)
+ (BOOL)initWithDictLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
