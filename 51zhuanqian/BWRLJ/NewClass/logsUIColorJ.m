#import "logsUIColorJ.h"
@implementation logsUIColorJ
+ (BOOL)YColorwithhexlogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)aColorwithhexalphalogs:(NSInteger)logs {
    return logs % 13 == 0;
}

@end
