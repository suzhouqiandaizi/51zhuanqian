#import "logsWYZQJiaoyimingxiTableViewCellT.h"
@implementation logsWYZQJiaoyimingxiTableViewCellT
+ (BOOL)hawakeFromNib:(NSInteger)logs {
    return logs % 50 == 0;
}
+ (BOOL)iSetselectedYAnimated:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
