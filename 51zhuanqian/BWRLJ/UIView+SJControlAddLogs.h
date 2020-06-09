#import <UIKit/UIKit.h>
#import "UIView+SJControlAdd.h"
#import <objc/message.h>

@interface UIView (SJControlAddLogs)
+ (BOOL)setDisappearTransformLogs:(NSInteger)logs;
+ (BOOL)disappearTransformLogs:(NSInteger)logs;
+ (BOOL)setDisappearTypeLogs:(NSInteger)logs;
+ (BOOL)disappearTypeLogs:(NSInteger)logs;
+ (BOOL)setAppearStateLogs:(NSInteger)logs;
+ (BOOL)appearStateLogs:(NSInteger)logs;
+ (BOOL)setAppearExeBlockLogs:(NSInteger)logs;
+ (BOOL)(__kindof UIView * _Nonnull))appearExeBlockLogs:(NSInteger)logs;
+ (BOOL)setDisappearExeBlockLogs:(NSInteger)logs;
+ (BOOL)(__kindof UIView * _Nonnull))disappearExeBlockLogs:(NSInteger)logs;
+ (BOOL)appearLogs:(NSInteger)logs;
+ (BOOL)disappearLogs:(NSInteger)logs;
+ (BOOL)__changeStateLogs:(NSInteger)logs;

@end
