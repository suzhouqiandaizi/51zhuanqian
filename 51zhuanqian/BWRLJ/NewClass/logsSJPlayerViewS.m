#import "logsSJPlayerViewS.h"
@implementation logsSJPlayerViewS
+ (BOOL)wInitwithframe:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)xHittestCWithevent:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)GlayoutSubviews:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)hWillmovetowindow:(NSInteger)logs {
    return logs % 18 == 0;
}

@end
