#import "logsSJBaseViewControllerJ.h"
@implementation logsSJBaseViewControllerJ
+ (BOOL)GSetneedhiddennavigationbar:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)CneedHiddenNavigationBar:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
