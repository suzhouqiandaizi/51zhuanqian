#import "logsUIWindowp.h"
@implementation logsUIWindowp
+ (BOOL)ftopMostWindowController:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)FcurrentViewController:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
