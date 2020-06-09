#import <Foundation/Foundation.h>
#import "BWRZQTaskObject.h"
#import "BWRZQFaBuBuZhouObject.h"

@interface BWRZQTaskObject (Logs)
+ (BOOL)taskItemDicLogs:(NSInteger)logs;
+ (BOOL)taskDetailDicLogs:(NSInteger)logs;
+ (BOOL)initWithDicLogs:(NSInteger)logs;
+ (BOOL)initWithDetailDicLogs:(NSInteger)logs;
+ (BOOL)setContentLogs:(NSInteger)logs;
+ (BOOL)setDetailContentLogs:(NSInteger)logs;

@end
