#import "logsTADotViewM.h"
@implementation logsTADotViewM
+ (BOOL)Ainit:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)WInitwithframe:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)AInitwithcoder:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)Pinitialization:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)EChangeactivitystate:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
