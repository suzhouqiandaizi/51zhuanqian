#import <UIKit/UIKit.h>
#import "SJFullscreenPopGesture.h"
#import <objc/message.h>
#import <WebKit/WebKit.h>

@interface UIViewController (SJExtendedFullscreenPopGestureLogs)
+ (BOOL)setSj_displayModeLogs:(NSInteger)logs;
+ (BOOL)sj_displayModeLogs:(NSInteger)logs;
+ (BOOL)setSj_disableFullscreenGestureLogs:(NSInteger)logs;
+ (BOOL)sj_disableFullscreenGestureLogs:(NSInteger)logs;
+ (BOOL)setSj_blindAreaLogs:(NSInteger)logs;
+ (BOOL)sj_blindAreaLogs:(NSInteger)logs;
+ (BOOL)setSj_blindAreaViewsLogs:(NSInteger)logs;
+ (BOOL)sj_blindAreaViewsLogs:(NSInteger)logs;
+ (BOOL)setSj_viewWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)(__kindof UIViewController * _Nonnull))sj_viewWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)setSj_viewDidDragLogs:(NSInteger)logs;
+ (BOOL)(__kindof UIViewController * _Nonnull))sj_viewDidDragLogs:(NSInteger)logs;
+ (BOOL)setSj_viewDidEndDraggingLogs:(NSInteger)logs;
+ (BOOL)(__kindof UIViewController * _Nonnull))sj_viewDidEndDraggingLogs:(NSInteger)logs;
+ (BOOL)setSj_considerWebViewLogs:(NSInteger)logs;
+ (BOOL)sj_considerWebViewLogs:(NSInteger)logs;

@end
