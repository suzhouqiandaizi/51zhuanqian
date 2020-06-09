#import "logsBWRZQBlacklistTableViewCellL.h"
@implementation logsBWRZQBlacklistTableViewCellL
+ (BOOL)mawakeFromNib:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)DSetselectedDAnimated:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)bcancelPress:(NSInteger)logs {
    return logs % 7 == 0;
}

@end
