#import "logsCustomNavigationCoutrollerb.h"
@implementation logsCustomNavigationCoutrollerb
+ (BOOL)JInitlogs:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)rInitwithrootviewcontrollerlogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
