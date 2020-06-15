#import "logsWYZQCoinRecordTableViewCellu.h"
@implementation logsWYZQCoinRecordTableViewCellu
+ (BOOL)cawakeFromNib:(NSInteger)logs {
    return logs % 39 == 0;
}
+ (BOOL)dSetselectedWAnimated:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
