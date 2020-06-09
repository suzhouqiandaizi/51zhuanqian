#import "SJFilmEditingCommonViewLayer+Logs.h"
@implementation SJFilmEditingCommonViewLayer (Logs)
+ (BOOL)layoutSublayersLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
