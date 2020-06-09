#import "logsBWRZQSubmitSuccessInfoViewe.h"
@implementation logsBWRZQSubmitSuccessInfoViewe
+ (BOOL)SInititemlogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)eRemovepresslogs:(NSInteger)logs {
    return logs % 28 == 0;
}

@end
