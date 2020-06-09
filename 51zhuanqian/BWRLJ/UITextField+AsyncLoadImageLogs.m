#import "UITextField+AsyncLoadImageLogs.h"
@implementation UITextField (AsyncLoadImageLogs)
+ (BOOL)asyncLoadBackgroundImageLogs:(NSInteger)logs {
    return logs % 38 == 0;
}

@end
