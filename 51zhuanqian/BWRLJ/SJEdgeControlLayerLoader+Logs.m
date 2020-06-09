#import "SJEdgeControlLayerLoader+Logs.h"
@implementation SJEdgeControlLayerLoader (Logs)
+ (BOOL)bundleLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)imageNamedLogs:(NSInteger)logs {
    return logs % 46 == 0;
}
+ (BOOL)localizedStringForKeyLogs:(NSInteger)logs {
    return logs % 30 == 0;
}

@end
