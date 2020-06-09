#import "logsTAAbstractDotViewq.h"
@implementation logsTAAbstractDotViewq
+ (BOOL)Tinit:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)WChangeactivitystate:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
