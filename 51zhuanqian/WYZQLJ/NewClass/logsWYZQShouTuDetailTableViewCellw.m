#import "logsWYZQShouTuDetailTableViewCellw.h"
@implementation logsWYZQShouTuDetailTableViewCellw
+ (BOOL)pawakeFromNib:(NSInteger)logs {
    return logs % 12 == 0;
}
+ (BOOL)NSetselectedCAnimated:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
