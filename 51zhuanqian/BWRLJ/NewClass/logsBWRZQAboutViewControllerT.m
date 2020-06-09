#import "logsBWRZQAboutViewControllerT.h"
@implementation logsBWRZQAboutViewControllerT
+ (BOOL)JViewdidloadlogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)CHandletaplogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)AShowcontentlogs:(NSInteger)logs {
    return logs % 49 == 0;
}

@end
