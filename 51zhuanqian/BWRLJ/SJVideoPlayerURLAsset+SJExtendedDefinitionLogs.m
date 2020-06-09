#import "SJVideoPlayerURLAsset+SJExtendedDefinitionLogs.h"
@implementation SJVideoPlayerURLAsset (SJExtendedDefinitionLogs)
+ (BOOL)setDefinition_fullNameLogs:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)definition_fullNameLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)setDefinition_lastNameLogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)definition_lastNameLogs:(NSInteger)logs {
    return logs % 12 == 0;
}

@end
