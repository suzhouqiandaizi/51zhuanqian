#import "logsBWRZQTaskObjectc.h"
@implementation logsBWRZQTaskObjectc
+ (BOOL)fTaskitemdiclogs:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)STaskdetaildiclogs:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)EInitwithdiclogs:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)RInitwithdetaildiclogs:(NSInteger)logs {
    return logs % 40 == 0;
}
+ (BOOL)KSetcontentlogs:(NSInteger)logs {
    return logs % 8 == 0;
}
+ (BOOL)zSetdetailcontentlogs:(NSInteger)logs {
    return logs % 9 == 0;
}

@end
