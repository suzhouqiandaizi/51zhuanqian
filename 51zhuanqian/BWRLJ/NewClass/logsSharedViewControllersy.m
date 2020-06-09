#import "logsSharedViewControllersy.h"
@implementation logsSharedViewControllersy
+ (BOOL)WHomeviewconlogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)oTuiguangviewconlogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)yPersonviewconlogs:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
