#import "logsSJBaseVideoPlayery.h"
@implementation logsSJBaseVideoPlayery
+ (BOOL)vPlaywithurl:(NSInteger)logs {
    return logs % 38 == 0;
}
+ (BOOL)JSetasseturl:(NSInteger)logs {
    return logs % 4 == 0;
}
+ (BOOL)MassetURL:(NSInteger)logs {
    return logs % 31 == 0;
}

@end
