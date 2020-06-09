#import "logsBWRZQHomeTableViewCellk.h"
@implementation logsBWRZQHomeTableViewCellk
+ (BOOL)ZawakeFromNib:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)uSetselectedJAnimated:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)RShowcontent:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
