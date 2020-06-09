#import "SGPageTitleButton+Logs.h"
@implementation SGPageTitleButton (Logs)
+ (BOOL)setHighlightedLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
