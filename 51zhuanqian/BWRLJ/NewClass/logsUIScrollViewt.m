#import "logsUIScrollViewt.h"
@implementation logsUIScrollViewt
+ (BOOL)Xsj_commonConfig:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)Fsj_refreshConfig:(NSInteger)logs {
    return logs % 40 == 0;
}

@end
