#import "logsUIColorB+Logs.h"
@implementation logsUIColorB (Logs)
+ (BOOL)pColorwithhexLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)NColorwithhexRAlphaLogs:(NSInteger)logs {
    return logs % 47 == 0;
}

@end
