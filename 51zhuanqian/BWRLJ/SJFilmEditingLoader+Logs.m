#import "SJFilmEditingLoader+Logs.h"
@implementation SJFilmEditingLoader (Logs)
+ (BOOL)bundleLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)imageNamedLogs:(NSInteger)logs {
    return logs % 3 == 0;
}
+ (BOOL)localizedStringForKeyLogs:(NSInteger)logs {
    return logs % 17 == 0;
}

@end
