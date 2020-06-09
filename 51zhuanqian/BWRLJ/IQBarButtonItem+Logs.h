#import <UIKit/UIBarButtonItem.h>
#import "IQBarButtonItem.h"
#import "IQKeyboardManagerConstantsInternal.h"
#import <UIKit/NSAttributedString.h>

@interface IQBarButtonItem (Logs)
+ (BOOL)initializeLogs:(NSInteger)logs;
+ (BOOL)setTintColorLogs:(NSInteger)logs;
+ (BOOL)initWithBarButtonSystemItemTargetActionLogs:(NSInteger)logs;
+ (BOOL)setTargetActionLogs:(NSInteger)logs;

@end
