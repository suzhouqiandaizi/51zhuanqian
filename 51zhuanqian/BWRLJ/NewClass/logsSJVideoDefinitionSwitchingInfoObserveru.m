#import "logsSJVideoDefinitionSwitchingInfoObserveru.h"
@implementation logsSJVideoDefinitionSwitchingInfoObserveru
+ (BOOL)TInitwithinfo:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)ddealloc:(NSInteger)logs {
    return logs % 10 == 0;
}

@end
