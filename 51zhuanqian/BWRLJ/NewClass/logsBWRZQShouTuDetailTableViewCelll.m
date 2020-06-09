#import "logsBWRZQShouTuDetailTableViewCelll.h"
@implementation logsBWRZQShouTuDetailTableViewCelll
+ (BOOL)nawakeFromNib:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)mSetselectedyAnimated:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
