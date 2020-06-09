#import "SJFilmEditingResultShareItem+Logs.h"
@implementation SJFilmEditingResultShareItem (Logs)
+ (BOOL)initWithTitleImageLogs:(NSInteger)logs {
    return logs % 43 == 0;
}

@end
