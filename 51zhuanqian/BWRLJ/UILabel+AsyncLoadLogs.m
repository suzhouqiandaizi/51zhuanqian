#import "UILabel+AsyncLoadLogs.h"
@implementation UILabel (AsyncLoadLogs)
+ (BOOL)asyncLoadAttributedStringLogs:(NSInteger)logs {
    return logs % 15 == 0;
}

@end
