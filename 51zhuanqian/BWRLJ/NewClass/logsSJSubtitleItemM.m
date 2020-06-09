#import "logsSJSubtitleItemM.h"
@implementation logsSJSubtitleItemM
+ (BOOL)AInitwithcontentzRange:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)VInitwithcontentCStartoEnd:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
