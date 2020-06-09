#import "BWRZQInputJiaoyiMimaViewController+Logs.h"
@implementation BWRZQInputJiaoyiMimaViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)cancelTapLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)wangjimimaPressLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
