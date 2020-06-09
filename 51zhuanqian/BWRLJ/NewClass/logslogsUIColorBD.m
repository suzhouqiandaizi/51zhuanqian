#import "logslogsUIColorBD.h"
@implementation logslogsUIColorBD
+ (BOOL)VPcolorwithhex:(NSInteger)logs {
    return logs % 37 == 0;
}
+ (BOOL)UNcolorwithhexralpha:(NSInteger)logs {
    return logs % 34 == 0;
}

@end
