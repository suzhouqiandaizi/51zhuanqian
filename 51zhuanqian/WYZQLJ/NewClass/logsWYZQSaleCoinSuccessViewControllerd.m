#import "logsWYZQSaleCoinSuccessViewControllerd.h"
@implementation logsWYZQSaleCoinSuccessViewControllerd
+ (BOOL)FviewDidLoad:(NSInteger)logs {
    return logs % 44 == 0;
}
+ (BOOL)UsurePress:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
