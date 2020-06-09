#import "ShareView+Logs.h"
@implementation ShareView (Logs)
+ (BOOL)initItemContentWithtitleWithurlWithshareiconLogs:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)removePressLogs:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)qqPressLogs:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)weiboPressLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)pengyouquanPressLogs:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)weixinhaoyouPressLogs:(NSInteger)logs {
    return logs % 23 == 0;
}
+ (BOOL)shareTypeLogs:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)copyPressLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)OnCopyLinkLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
