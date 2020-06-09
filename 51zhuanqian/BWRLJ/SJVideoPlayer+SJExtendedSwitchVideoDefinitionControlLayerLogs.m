#import "SJVideoPlayer+SJExtendedSwitchVideoDefinitionControlLayerLogs.h"
@implementation SJVideoPlayer (SJExtendedSwitchVideoDefinitionControlLayerLogs)
+ (BOOL)setDefinitionURLAssetsLogs:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)definitionURLAssetsLogs:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
