#import "UIScrollView+SJAutoplayDeprecatedLogs.h"
@implementation UIScrollView (SJAutoplayDeprecatedLogs)
+ (BOOL)sj_needPlayNextAsset __deprecated_msg("use `sj_playNextVisibleAsset`")Logs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
