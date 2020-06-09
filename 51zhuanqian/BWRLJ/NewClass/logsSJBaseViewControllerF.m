#import "logsSJBaseViewControllerF.h"
@implementation logsSJBaseViewControllerF
+ (BOOL)xgetAppearStateObserver:(NSInteger)logs {
    return logs % 25 == 0;
}

@end
