#import "logsWYZQMessageTableViewCellh.h"
@implementation logsWYZQMessageTableViewCellh
+ (BOOL)hawakeFromNib:(NSInteger)logs {
    return logs % 47 == 0;
}
+ (BOOL)CSetselectedLAnimated:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
