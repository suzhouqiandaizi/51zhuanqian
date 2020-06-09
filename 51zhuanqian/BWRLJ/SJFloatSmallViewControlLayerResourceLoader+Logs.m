#import "SJFloatSmallViewControlLayerResourceLoader+Logs.h"
@implementation SJFloatSmallViewControlLayerResourceLoader (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)resetLogs:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)imageNamedLogs:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
