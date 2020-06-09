#import "SJFilmEditingSaveResultFailed+Logs.h"
@implementation SJFilmEditingSaveResultFailed (Logs)
+ (BOOL)initWithReasonLogs:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)toStringLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
