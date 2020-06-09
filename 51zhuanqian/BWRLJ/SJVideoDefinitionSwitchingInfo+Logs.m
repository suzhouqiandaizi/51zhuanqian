#import "SJVideoDefinitionSwitchingInfo+Logs.h"
@implementation SJVideoDefinitionSwitchingInfo (Logs)
+ (BOOL)getObserverLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)setStatusLogs:(NSInteger)logs {
    return logs % 46 == 0;
}

@end
