#import "logsSJFullscreenPopGesturev.h"
@implementation logsSJFullscreenPopGesturev
+ (BOOL)ESetgesturetype:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)AgestureType:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)GSettransitionmode:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)TtransitionMode:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)JSetmaxoffsettotriggerpop:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)ZmaxOffsetToTriggerPop:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
