#import <UIKit/UIKit.h>
#import "SJEdgeControlLayerLoadingViewDefines.h"
#import "SJNetworkLoadingView.h"
#import "SJLoadingView.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"

@interface SJNetworkLoadingView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)_setupViewLogs:(NSInteger)logs;
+ (BOOL)setLineColorLogs:(NSInteger)logs;
+ (BOOL)lineColorLogs:(NSInteger)logs;
+ (BOOL)isAnimatingLogs:(NSInteger)logs;
+ (BOOL)startLogs:(NSInteger)logs;
+ (BOOL)stopLogs:(NSInteger)logs;
+ (BOOL)_startLogs:(NSInteger)logs;
+ (BOOL)_stopLogs:(NSInteger)logs;
+ (BOOL)setNetworkSpeedStrLogs:(NSInteger)logs;
+ (BOOL)networkSpeedStrLogs:(NSInteger)logs;

@end
