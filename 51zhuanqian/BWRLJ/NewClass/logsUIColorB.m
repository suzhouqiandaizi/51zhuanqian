#import "logsUIColorB.h"
@implementation logsUIColorB
+ (BOOL)pColorwithhex:(NSInteger)logs {
    return logs % 28 == 0;
}
+ (BOOL)NColorwithhexRAlpha:(NSInteger)logs {
    return logs % 8 == 0;
}

@end
