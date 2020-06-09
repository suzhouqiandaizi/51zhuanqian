#import <UIKit/UIKit.h>
#import "XHLaunchAdButton.h"
#import "XHLaunchAdConst.h"

@interface XHLaunchAdButton (Logs)
+ (BOOL)initWithSkipTypeLogs:(NSInteger)logs;
+ (BOOL)timeLabLogs:(NSInteger)logs;
+ (BOOL)roundLayerLogs:(NSInteger)logs;
+ (BOOL)setTitleWithSkipTypeDurationLogs:(NSInteger)logs;
+ (BOOL)startRoundDispathTimerWithDurationLogs:(NSInteger)logs;
+ (BOOL)setLeftRightSpaceLogs:(NSInteger)logs;
+ (BOOL)setTopBottomSpaceLogs:(NSInteger)logs;
+ (BOOL)cornerRadiusWithViewLogs:(NSInteger)logs;

@end
