#import "logsBWRZQHomeTableViewCelln.h"
@implementation logsBWRZQHomeTableViewCelln
+ (BOOL)mAwakefromniblogs:(NSInteger)logs {
    return logs % 6 == 0;
}
+ (BOOL)ESetselectedanimatedlogs:(NSInteger)logs {
    return logs % 24 == 0;
}
+ (BOOL)IShowcontentlogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
