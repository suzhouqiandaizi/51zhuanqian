#import "SJUTStroke+Logs.h"
@implementation SJUTStroke (Logs)
+ (BOOL)paragraphStyleLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
