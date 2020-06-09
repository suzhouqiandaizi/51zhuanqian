#import "logsBWRZQBlacklistTableViewCellx.h"
@implementation logsBWRZQBlacklistTableViewCellx
+ (BOOL)yAwakefromniblogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)YSetselectedanimatedlogs:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)ACancelpresslogs:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
