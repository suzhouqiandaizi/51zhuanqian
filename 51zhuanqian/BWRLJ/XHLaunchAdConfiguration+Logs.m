#import "XHLaunchAdConfiguration+Logs.h"
@implementation XHLaunchAdConfiguration (Logs)
+ (BOOL)defaultConfigurationLogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
