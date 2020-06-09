#import "logsSJVideoDefinitionSwitchingInfod.h"
@implementation logsSJVideoDefinitionSwitchingInfod
+ (BOOL)QgetObserver:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)QSetstatus:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
