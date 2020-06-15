#import "logsWYZQInputJiaoyiMimaViewControllerH.h"
@implementation logsWYZQInputJiaoyiMimaViewControllerH
+ (BOOL)xviewDidLoad:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)BcancelTap:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)cwangjimimaPress:(NSInteger)logs {
    return logs % 42 == 0;
}

@end
