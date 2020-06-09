#import "logsBWRZQSubmitSuccessInfoViewV.h"
@implementation logsBWRZQSubmitSuccessInfoViewV
+ (BOOL)IinitItem:(NSInteger)logs {
    return logs % 1 == 0;
}
+ (BOOL)EremovePress:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
