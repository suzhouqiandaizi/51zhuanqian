#import "NSObject+IQ_LoggingLogs.h"
@implementation NSObject (IQ_LoggingLogs)
+ (BOOL)_IQDescriptionLogs:(NSInteger)logs {
    return logs % 14 == 0;
}

@end
