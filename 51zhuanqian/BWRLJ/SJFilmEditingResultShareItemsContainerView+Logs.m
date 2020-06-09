#import "SJFilmEditingResultShareItemsContainerView+Logs.h"
@implementation SJFilmEditingResultShareItemsContainerView (Logs)
+ (BOOL)clickedBtnLogs:(NSInteger)logs {
    return logs % 32 == 0;
}
+ (BOOL)setShareItemsLogs:(NSInteger)logs {
    return logs % 2 == 0;
}

@end
