#import "SJFilmEditingButtonContainerView+Logs.h"
@implementation SJFilmEditingButtonContainerView (Logs)
+ (BOOL)initWithFrameButtonsizeLogs:(NSInteger)logs {
    return logs % 18 == 0;
}
+ (BOOL)clickedBackBtnLogs:(NSInteger)logs {
    return logs % 22 == 0;
}

@end
