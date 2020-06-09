#import "logsUINavigationControllerC.h"
@implementation logsUINavigationControllerC
+ (BOOL)Cload:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)pSj_PushviewcontrollerMAnimated:(NSInteger)logs {
    return logs % 7 == 0;
}
+ (BOOL)asj_setupIfNeeded:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)Msj_fullscreenGesture:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)FSj_Handlefullscreengesture:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
