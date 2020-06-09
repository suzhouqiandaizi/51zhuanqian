#import "logsSJBarrageItemF.h"
@implementation logsSJBarrageItemF
+ (BOOL)HInitwithcontent:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)wInitwithcustomview:(NSInteger)logs {
    return logs % 3 == 0;
}

@end
