#import "logsBWRZQShouTuDetailTableViewCellF.h"
@implementation logsBWRZQShouTuDetailTableViewCellF
+ (BOOL)TAwakefromniblogs:(NSInteger)logs {
    return logs % 20 == 0;
}
+ (BOOL)ASetselectedanimatedlogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
