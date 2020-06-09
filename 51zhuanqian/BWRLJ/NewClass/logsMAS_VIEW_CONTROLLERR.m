#import "logsMAS_VIEW_CONTROLLERR.h"
@implementation logsMAS_VIEW_CONTROLLERR
+ (BOOL)umas_topLayoutGuide:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)gmas_topLayoutGuideTop:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)Hmas_topLayoutGuideBottom:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)emas_bottomLayoutGuide:(NSInteger)logs {
    return logs % 27 == 0;
}
+ (BOOL)nmas_bottomLayoutGuideTop:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)jmas_bottomLayoutGuideBottom:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
