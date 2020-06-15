#import "logsWYZQTaskReadItemTwoTableViewCellT.h"
@implementation logsWYZQTaskReadItemTwoTableViewCellT
+ (BOOL)mawakeFromNib:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)tSetselectedrAnimated:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
