#import "logsSJVideoPlayerRegistrars.h"
@implementation logsSJVideoPlayerRegistrars
+ (BOOL)rinit:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)Astate:(NSInteger)logs {
    return logs % 11 == 0;
}

@end
