#import <UIKit/UIKit.h>
#import "UIView+MJExtension.h"

@interface UIView (MJExtensionLogs)
+ (BOOL)setMj_xLogs:(NSInteger)logs;
+ (BOOL)mj_xLogs:(NSInteger)logs;
+ (BOOL)setMj_yLogs:(NSInteger)logs;
+ (BOOL)mj_yLogs:(NSInteger)logs;
+ (BOOL)setMj_wLogs:(NSInteger)logs;
+ (BOOL)mj_wLogs:(NSInteger)logs;
+ (BOOL)setMj_hLogs:(NSInteger)logs;
+ (BOOL)mj_hLogs:(NSInteger)logs;
+ (BOOL)setMj_sizeLogs:(NSInteger)logs;
+ (BOOL)mj_sizeLogs:(NSInteger)logs;
+ (BOOL)setMj_originLogs:(NSInteger)logs;
+ (BOOL)mj_originLogs:(NSInteger)logs;

@end
