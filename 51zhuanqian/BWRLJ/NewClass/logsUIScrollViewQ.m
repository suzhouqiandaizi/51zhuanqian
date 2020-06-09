#import "logsUIScrollViewq.h"
@implementation logsUIScrollViewq
+ (BOOL)vsj_needPlayNextAsset __deprecated_msg("use `sj_playNextVisibleAsset`"):(NSInteger)logs {
    return logs % 50 == 0;
}

@end
