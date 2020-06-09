#import "logsCustomNavigationCoutrollerV.h"
@implementation logsCustomNavigationCoutrollerV
+ (BOOL)Dinit:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)xInitwithrootviewcontroller:(NSInteger)logs {
    return logs % 27 == 0;
}

@end
