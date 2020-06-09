#import "logslogsCustomNavigationCoutrollerVL.h"
@implementation logslogsCustomNavigationCoutrollerVL
+ (BOOL)pDinit:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)wXinitwithrootviewcontroller:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
