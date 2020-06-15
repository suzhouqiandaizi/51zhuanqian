#import "logsWYZQTaskFabuResultTableViewCellX.h"
@implementation logsWYZQTaskFabuResultTableViewCellX
+ (BOOL)WawakeFromNib:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)rSetselectedUAnimated:(NSInteger)logs {
    return logs % 5 == 0;
}

@end
