#import "logsUIScrollViewn.h"
@implementation logsUIScrollViewn
+ (BOOL)NSetmj_Header:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)Cmj_header:(NSInteger)logs {
    return logs % 19 == 0;
}
+ (BOOL)HSetmj_Footer:(NSInteger)logs {
    return logs % 25 == 0;
}
+ (BOOL)qmj_footer:(NSInteger)logs {
    return logs % 34 == 0;
}
+ (BOOL)YSetfooter:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)Mfooter:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)DSetheader:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)uheader:(NSInteger)logs {
    return logs % 22 == 0;
}
+ (BOOL)hmj_totalDataCount:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
