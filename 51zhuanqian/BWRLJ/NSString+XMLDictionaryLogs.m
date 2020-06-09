#import "NSString+XMLDictionaryLogs.h"
@implementation NSString (XMLDictionaryLogs)
+ (BOOL)XMLEncodedStringLogs:(NSInteger)logs {
    return logs % 20 == 0;
}

@end
