#import "SJFilmEditingSettingsUpdatedObserver+Logs.h"
@implementation SJFilmEditingSettingsUpdatedObserver (Logs)
+ (BOOL)initLogs:(NSInteger)logs {
    return logs % 33 == 0;
}
+ (BOOL)deallocLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
