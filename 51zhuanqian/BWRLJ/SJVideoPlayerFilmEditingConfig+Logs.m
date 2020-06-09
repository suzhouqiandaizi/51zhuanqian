#import "SJVideoPlayerFilmEditingConfig+Logs.h"
@implementation SJVideoPlayerFilmEditingConfig (Logs)
+ (BOOL)configLogs:(NSInteger)logs {
    return logs % 1 == 0;
}

@end
