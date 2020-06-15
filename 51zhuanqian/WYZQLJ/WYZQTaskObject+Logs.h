#import <Foundation/Foundation.h>
#import "WYZQTaskObject.h"
#import "WYZQFaBuBuZhouObject.h"

@interface WYZQTaskObject (Logs)
+ (BOOL)taskItemDicLogs:(NSInteger)logs;
+ (BOOL)taskDetailDicLogs:(NSInteger)logs;
+ (BOOL)initWithDicLogs:(NSInteger)logs;
+ (BOOL)initWithDetailDicLogs:(NSInteger)logs;
+ (BOOL)setContentLogs:(NSInteger)logs;
+ (BOOL)setDetailContentLogs:(NSInteger)logs;

@end
