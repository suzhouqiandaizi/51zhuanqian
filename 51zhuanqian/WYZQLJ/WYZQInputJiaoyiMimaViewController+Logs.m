#import "WYZQInputJiaoyiMimaViewController+Logs.h"
@implementation WYZQInputJiaoyiMimaViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)cancelTapLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)wangjimimaPressLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
