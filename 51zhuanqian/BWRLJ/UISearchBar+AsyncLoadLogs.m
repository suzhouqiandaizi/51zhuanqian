#import "UISearchBar+AsyncLoadLogs.h"
@implementation UISearchBar (AsyncLoadLogs)
+ (BOOL)asyncLoadIconImageForsearchbariconStateLogs:(NSInteger)logs {
    return logs % 21 == 0;
}
+ (BOOL)asyncLoadSearchFieldBackgroundImageForstateLogs:(NSInteger)logs {
    return logs % 21 == 0;
}

@end
