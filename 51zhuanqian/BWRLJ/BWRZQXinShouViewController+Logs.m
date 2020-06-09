#import "BWRZQXinShouViewController+Logs.h"
@implementation BWRZQXinShouViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)prepareForSegueSenderLogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
