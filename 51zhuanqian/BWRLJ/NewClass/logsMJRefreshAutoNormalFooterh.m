#import "logsMJRefreshAutoNormalFooterh.h"
@implementation logsMJRefreshAutoNormalFooterh
+ (BOOL)mloadingView:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)oSetactivityindicatorviewstyle:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)mprepare:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)MplaceSubviews:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)dSetstate:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
