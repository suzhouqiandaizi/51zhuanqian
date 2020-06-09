#import "logsSJPlaybackListControllerObserverF.h"
@implementation logsSJPlaybackListControllerObserverF
+ (BOOL)tInitwithlistcontroller:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)Cdealloc:(NSInteger)logs {
    return logs % 40 == 0;
}

@end
