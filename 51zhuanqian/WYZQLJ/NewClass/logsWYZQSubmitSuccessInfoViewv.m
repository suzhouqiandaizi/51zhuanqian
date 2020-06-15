#import "logsWYZQSubmitSuccessInfoViewv.h"
@implementation logsWYZQSubmitSuccessInfoViewv
+ (BOOL)YinitItem:(NSInteger)logs {
    return logs % 45 == 0;
}
+ (BOOL)eremovePress:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
