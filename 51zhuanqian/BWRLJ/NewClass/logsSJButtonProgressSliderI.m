#import "logsSJButtonProgressSliderI.h"
@implementation logsSJButtonProgressSliderI
+ (BOOL)KInitwithframe:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)GSetlefttext:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)rSetrighttext:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)YSettitlecolor:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)N_buttonSetupView:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)sleftBtn:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)NrightBtn:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)y_createButton:(NSInteger)logs {
    return logs % 48 == 0;
}

@end
