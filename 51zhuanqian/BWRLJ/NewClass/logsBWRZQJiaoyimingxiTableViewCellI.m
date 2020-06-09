#import "logsBWRZQJiaoyimingxiTableViewCellI.h"
@implementation logsBWRZQJiaoyimingxiTableViewCellI
+ (BOOL)kawakeFromNib:(NSInteger)logs {
    return logs % 43 == 0;
}
+ (BOOL)OSetselectedCAnimated:(NSInteger)logs {
    return logs % 26 == 0;
}

@end
