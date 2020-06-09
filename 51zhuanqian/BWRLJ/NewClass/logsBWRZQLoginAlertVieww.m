#import "logsBWRZQLoginAlertVieww.h"
@implementation logsBWRZQLoginAlertVieww
+ (BOOL)VinitItem:(NSInteger)logs {
    return logs % 14 == 0;
}
+ (BOOL)hremovePress:(NSInteger)logs {
    return logs % 47 == 0;
}

@end
