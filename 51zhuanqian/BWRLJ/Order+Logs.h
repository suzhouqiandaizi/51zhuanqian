#import <Foundation/Foundation.h>
#import "Order.h"

@interface Order (Logs)
+ (BOOL)orderInfoEncodedLogs:(NSInteger)logs;
+ (BOOL)orderItemWithKeyAndvalueEncodedLogs:(NSInteger)logs;
+ (BOOL)encodeValueLogs:(NSInteger)logs;

@end
