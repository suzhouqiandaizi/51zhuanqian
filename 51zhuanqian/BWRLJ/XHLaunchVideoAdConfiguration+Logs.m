#import "XHLaunchVideoAdConfiguration+Logs.h"
@implementation XHLaunchVideoAdConfiguration (Logs)
+ (BOOL)defaultConfigurationLogs:(NSInteger)logs {
    return logs % 50 == 0;
}

@end
