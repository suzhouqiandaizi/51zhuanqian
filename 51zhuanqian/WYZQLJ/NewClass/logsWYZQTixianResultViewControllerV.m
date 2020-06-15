#import "logsWYZQTixianResultViewControllerV.h"
@implementation logsWYZQTixianResultViewControllerV
+ (BOOL)bviewDidLoad:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)kgoCustomBackAction:(NSInteger)logs {
    return logs % 31 == 0;
}
+ (BOOL)OcustomBackPress:(NSInteger)logs {
    return logs % 33 == 0;
}

@end
