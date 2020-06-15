#import "logsWYZQTaskReadItemOneTableViewCellv.h"
@implementation logsWYZQTaskReadItemOneTableViewCellv
+ (BOOL)WawakeFromNib:(NSInteger)logs {
    return logs % 42 == 0;
}
+ (BOOL)FSetselectedPAnimated:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
