#import "logsMJRefreshBackNormalFooterp.h"
@implementation logsMJRefreshBackNormalFooterp
+ (BOOL)narrowView:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)BloadingView:(NSInteger)logs {
    return logs % 9 == 0;
}
+ (BOOL)lSetactivityindicatorviewstyle:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)Bprepare:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)WplaceSubviews:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)MSetstate:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
