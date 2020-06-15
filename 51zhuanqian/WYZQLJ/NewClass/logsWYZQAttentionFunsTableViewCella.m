#import "logsWYZQAttentionFunsTableViewCella.h"
@implementation logsWYZQAttentionFunsTableViewCella
+ (BOOL)xawakeFromNib:(NSInteger)logs {
    return logs % 26 == 0;
}
+ (BOOL)uSetselectedwAnimated:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
