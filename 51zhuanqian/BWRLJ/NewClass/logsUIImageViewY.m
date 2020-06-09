#import "logsUIImageViewY.h"
@implementation logsUIImageViewY
+ (BOOL)GSd_Sethighlightedimagewithurl:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)SSd_SethighlightedimagewithurlMOptions:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)DSd_SethighlightedimagewithurlCCompleted:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)SSd_SethighlightedimagewithurlpOptionsdCompleted:(NSInteger)logs {
    return logs % 41 == 0;
}
+ (BOOL)aSd_SethighlightedimagewithurlIOptionsVProgressdCompleted:(NSInteger)logs {
    return logs % 6 == 0;
}

@end
