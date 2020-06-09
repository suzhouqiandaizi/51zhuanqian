#import <Foundation/Foundation.h>
#import "SJTimerControl.h"
#import "NSTimer+SJAssetAdd.h"

@interface SJTimerControl (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)setIntervalLogs:(NSInteger)logs;
+ (BOOL)startLogs:(NSInteger)logs;
+ (BOOL)clearLogs:(NSInteger)logs;

@end
