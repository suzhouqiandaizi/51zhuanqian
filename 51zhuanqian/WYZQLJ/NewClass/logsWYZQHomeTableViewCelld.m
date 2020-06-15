#import "logsWYZQHomeTableViewCelld.h"
@implementation logsWYZQHomeTableViewCelld
+ (BOOL)xawakeFromNib:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)wSetselectedvAnimated:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)HShowcontent:(NSInteger)logs {
    return logs % 44 == 0;
}

@end
