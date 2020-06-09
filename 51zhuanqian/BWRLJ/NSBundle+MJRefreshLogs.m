#import "NSBundle+MJRefreshLogs.h"
@implementation NSBundle (MJRefreshLogs)
+ (BOOL)mj_refreshBundleLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)mj_arrowImageLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)mj_localizedStringForKeyLogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)mj_localizedStringForKeyValueLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
