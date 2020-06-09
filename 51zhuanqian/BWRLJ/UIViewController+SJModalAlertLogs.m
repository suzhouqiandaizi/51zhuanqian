#import "UIViewController+SJModalAlertLogs.h"
@implementation UIViewController (SJModalAlertLogs)
+ (BOOL)sj_modalTextAlertAcceptCancelPlaceholderCallbackLogs:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
