#import "logsBWRZQTixianResultViewControllerH.h"
@implementation logsBWRZQTixianResultViewControllerH
+ (BOOL)CviewDidLoad:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)xgoCustomBackAction:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)ScustomBackPress:(NSInteger)logs {
    return logs % 16 == 0;
}

@end
