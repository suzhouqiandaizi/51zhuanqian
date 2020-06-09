#import "logsBWRZQSubmitSuccessInfoViewe+Logs.h"
@implementation logsBWRZQSubmitSuccessInfoViewe (Logs)
+ (BOOL)SInititemlogsLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)eRemovepresslogsLogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
