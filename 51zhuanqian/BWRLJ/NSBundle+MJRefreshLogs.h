#import <UIKit/UIKit.h>
#import "NSBundle+MJRefresh.h"
#import "MJRefreshComponent.h"
#import "MJRefreshConfig.h"

@interface NSBundle (MJRefreshLogs)
+ (BOOL)mj_refreshBundleLogs:(NSInteger)logs;
+ (BOOL)mj_arrowImageLogs:(NSInteger)logs;
+ (BOOL)mj_localizedStringForKeyLogs:(NSInteger)logs;
+ (BOOL)mj_localizedStringForKeyValueLogs:(NSInteger)logs;

@end
