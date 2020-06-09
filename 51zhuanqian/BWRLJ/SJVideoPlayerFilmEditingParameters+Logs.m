#import "SJVideoPlayerFilmEditingParameters+Logs.h"
@implementation SJVideoPlayerFilmEditingParameters (Logs)
+ (BOOL)initWithOperationRangeLogs:(NSInteger)logs {
    return logs % 4 == 0;
}

@end
