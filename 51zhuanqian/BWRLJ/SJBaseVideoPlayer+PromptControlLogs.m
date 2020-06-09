#import "SJBaseVideoPlayer+PromptControlLogs.h"
@implementation SJBaseVideoPlayer (PromptControlLogs)
+ (BOOL)setPopPromptControllerLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)popPromptControllerLogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)_setupPopPromptControllerLogs:(NSInteger)logs {
    return logs % 10 == 0;
}
+ (BOOL)setPromptLogs:(NSInteger)logs {
    return logs % 35 == 0;
}
+ (BOOL)promptLogs:(NSInteger)logs {
    return logs % 2 == 0;
}
+ (BOOL)_setupPromptLogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
