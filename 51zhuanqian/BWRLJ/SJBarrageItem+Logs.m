#import "SJBarrageItem+Logs.h"
@implementation SJBarrageItem (Logs)
+ (BOOL)initWithContentLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)initWithCustomViewLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
