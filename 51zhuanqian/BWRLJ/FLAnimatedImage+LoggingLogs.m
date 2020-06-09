#import "FLAnimatedImage+LoggingLogs.h"
@implementation FLAnimatedImage (LoggingLogs)
+ (BOOL)setLogBlockLoglevelLogs:(NSInteger)logs {
    return logs % 13 == 0;
}
+ (BOOL)logStringFromBlockWithlevelLogs:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
