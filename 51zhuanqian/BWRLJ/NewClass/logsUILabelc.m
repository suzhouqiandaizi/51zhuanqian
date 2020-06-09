#import "logsUILabelC.h"
@implementation logsUILabelC
+ (BOOL)Rmj_label:(NSInteger)logs {
    return logs % 30 == 0;
}
+ (BOOL)Gmj_textWidth:(NSInteger)logs {
    return logs % 24 == 0;
}

@end
