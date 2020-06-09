#import "logsShareViews.h"
@implementation logsShareViews
+ (BOOL)YInititemcontentxWithtitlemWithurlYWithshareicon:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)gremovePress:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)WqqPress:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)tweiboPress:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)FpengyouquanPress:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)gweixinhaoyouPress:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)fSharetype:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)pcopyPress:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)DOnCopyLink:(NSInteger)logs {
    return logs % 23 == 0;
}

@end
