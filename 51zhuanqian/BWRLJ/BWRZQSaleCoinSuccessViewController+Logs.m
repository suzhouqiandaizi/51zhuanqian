#import "BWRZQSaleCoinSuccessViewController+Logs.h"
@implementation BWRZQSaleCoinSuccessViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)surePressLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)prepareForSegueSenderLogs:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
