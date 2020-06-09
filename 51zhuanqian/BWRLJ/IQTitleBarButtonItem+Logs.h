#import "IQKeyboardManagerConstants.h"
#import "IQBarButtonItem.h"
#import <Foundation/NSObjCRuntime.h>
#import "IQTitleBarButtonItem.h"
#import "IQKeyboardManagerConstants.h"
#import "IQKeyboardManagerConstantsInternal.h"
#import <UIKit/UILabel.h>
#import <UIKit/UIButton.h>

@interface IQTitleBarButtonItem (Logs)
+ (BOOL)initWithTitleLogs:(NSInteger)logs;
+ (BOOL)setTitleFontLogs:(NSInteger)logs;
+ (BOOL)setTitleLogs:(NSInteger)logs;
+ (BOOL)setSelectableTextColorLogs:(NSInteger)logs;
+ (BOOL)setInvocationLogs:(NSInteger)logs;

@end
