#import <Foundation/Foundation.h>
#import "SJBarrageQueueControllerDefines.h"
#import "SJBarrageItem.h"

@interface SJBarrageItem (Logs)
+ (BOOL)initWithContentLogs:(NSInteger)logs;
+ (BOOL)initWithCustomViewLogs:(NSInteger)logs;

@end
