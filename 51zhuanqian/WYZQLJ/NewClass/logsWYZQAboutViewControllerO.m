#import "logsWYZQAboutViewControllerO.h"
@implementation logsWYZQAboutViewControllerO
+ (BOOL)DviewDidLoad:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)tHandletap:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)nShowcontent:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
