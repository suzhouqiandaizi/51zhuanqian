#import <Foundation/Foundation.h>
#import "SJControlLayerAppearManagerDefines.h"
#import "SJControlLayerAppearStateManager.h"
#import "SJTimerControl.h"

@interface SJControlLayerAppearStateManager (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)setIntervalLogs:(NSInteger)logs;
+ (BOOL)intervalLogs:(NSInteger)logs;
+ (BOOL)switchAppearStateLogs:(NSInteger)logs;
+ (BOOL)needAppearLogs:(NSInteger)logs;
+ (BOOL)needDisappearLogs:(NSInteger)logs;
+ (BOOL)resumeLogs:(NSInteger)logs;
+ (BOOL)keepAppearStateLogs:(NSInteger)logs;
+ (BOOL)keepDisappearStateLogs:(NSInteger)logs;
+ (BOOL)setIsAppearedLogs:(NSInteger)logs;
+ (BOOL)setDisabledLogs:(NSInteger)logs;
+ (BOOL)_startLogs:(NSInteger)logs;
+ (BOOL)_clearLogs:(NSInteger)logs;

@end
