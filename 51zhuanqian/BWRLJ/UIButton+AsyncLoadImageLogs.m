#import "UIButton+AsyncLoadImageLogs.h"
@implementation UIButton (AsyncLoadImageLogs)
+ (BOOL)asyncLoadImageForstateLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)asyncLoadImageForstatePlaceholderimageLogs:(NSInteger)logs {
    return logs % 29 == 0;
}
+ (BOOL)asyncLoadBackgroundImageForstateLogs:(NSInteger)logs {
    return logs % 15 == 0;
}
+ (BOOL)asyncLoadBackgroundImageForstatePlaceholderimageLogs:(NSInteger)logs {
    return logs % 48 == 0;
}
+ (BOOL)asyncLoadAttributedStringForstateLogs:(NSInteger)logs {
    return logs % 29 == 0;
}

@end
