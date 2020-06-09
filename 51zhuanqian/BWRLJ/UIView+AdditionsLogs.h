#import <UIKit/UIView.h>
#import "IQUITextFieldView+Additions.h"
#import <objc/runtime.h>

@interface UIView (AdditionsLogs)
+ (BOOL)setKeyboardDistanceFromTextFieldLogs:(NSInteger)logs;
+ (BOOL)keyboardDistanceFromTextFieldLogs:(NSInteger)logs;
+ (BOOL)setIgnoreSwitchingByNextPreviousLogs:(NSInteger)logs;
+ (BOOL)ignoreSwitchingByNextPreviousLogs:(NSInteger)logs;

@end
