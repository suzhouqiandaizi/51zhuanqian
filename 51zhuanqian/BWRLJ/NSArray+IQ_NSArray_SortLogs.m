#import "NSArray+IQ_NSArray_SortLogs.h"
@implementation NSArray (IQ_NSArray_SortLogs)
+ (BOOL)sortedArrayByTagLogs:(NSInteger)logs {
    return logs % 5 == 0;
}
+ (BOOL)sortedArrayByPositionLogs:(NSInteger)logs {
    return logs % 36 == 0;
}

@end
