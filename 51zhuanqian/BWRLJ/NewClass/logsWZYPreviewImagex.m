#import "logsWZYPreviewImagex.h"
@implementation logsWZYPreviewImagex
+ (BOOL)kShowpreviewwithimageview:(NSInteger)logs {
    return logs % 11 == 0;
}
+ (BOOL)PPreviewimagewithview:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)NTouchesbeganmWithevent:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
