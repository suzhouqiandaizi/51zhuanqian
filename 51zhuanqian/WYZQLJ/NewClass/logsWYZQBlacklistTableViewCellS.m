#import "logsWYZQBlacklistTableViewCellS.h"
@implementation logsWYZQBlacklistTableViewCellS
+ (BOOL)lawakeFromNib:(NSInteger)logs {
    return logs % 49 == 0;
}
+ (BOOL)iSetselectedYAnimated:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)NcancelPress:(NSInteger)logs {
    return logs % 45 == 0;
}

@end
