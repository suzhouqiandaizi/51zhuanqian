#import "logsNSImagev.h"
@implementation logsNSImagev
+ (BOOL)UCGImage:(NSInteger)logs {
    return logs % 16 == 0;
}
+ (BOOL)uimages:(NSInteger)logs {
    return logs % 36 == 0;
}
+ (BOOL)UisGIF:(NSInteger)logs {
    return logs % 41 == 0;
}

@end
