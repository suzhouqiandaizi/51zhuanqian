#import "logsMJRefreshBackStateFooterd.h"
@implementation logsMJRefreshBackStateFooterd
+ (BOOL)SstateTitles:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)JstateLabel:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)hSettitleTForstate:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)rTitleforstate:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)Vprepare:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)SplaceSubviews:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)eSetstate:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
