#import <Foundation/Foundation.h>
#import "NSTimer+SJAssetAdd.h"

@interface NSTimer (SJAssetAddLogs)
+ (BOOL)assetAdd_timerWithTimeIntervalBlockRepeatsLogs:(NSInteger)logs;
+ (BOOL)assetAdd_exeBlockLogs:(NSInteger)logs;
+ (BOOL)assetAdd_fireLogs:(NSInteger)logs;

@end
