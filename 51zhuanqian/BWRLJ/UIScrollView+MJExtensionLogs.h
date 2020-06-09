#import <UIKit/UIKit.h>
#import "UIScrollView+MJExtension.h"
#import <objc/runtime.h>

@interface UIScrollView (MJExtensionLogs)
+ (BOOL)initializeLogs:(NSInteger)logs;
+ (BOOL)mj_insetLogs:(NSInteger)logs;
+ (BOOL)setMj_insetTLogs:(NSInteger)logs;
+ (BOOL)mj_insetTLogs:(NSInteger)logs;
+ (BOOL)setMj_insetBLogs:(NSInteger)logs;
+ (BOOL)mj_insetBLogs:(NSInteger)logs;
+ (BOOL)setMj_insetLLogs:(NSInteger)logs;
+ (BOOL)mj_insetLLogs:(NSInteger)logs;
+ (BOOL)setMj_insetRLogs:(NSInteger)logs;
+ (BOOL)mj_insetRLogs:(NSInteger)logs;
+ (BOOL)setMj_offsetXLogs:(NSInteger)logs;
+ (BOOL)mj_offsetXLogs:(NSInteger)logs;
+ (BOOL)setMj_offsetYLogs:(NSInteger)logs;
+ (BOOL)mj_offsetYLogs:(NSInteger)logs;
+ (BOOL)setMj_contentWLogs:(NSInteger)logs;
+ (BOOL)mj_contentWLogs:(NSInteger)logs;
+ (BOOL)setMj_contentHLogs:(NSInteger)logs;
+ (BOOL)mj_contentHLogs:(NSInteger)logs;

@end
