#import <UIKit/UIKit.h>
#import "BWRZQLoginPrivacyProtocolView.h"
#import "UILabel+YBAttributeTextTapAction.h"

@interface BWRZQLoginPrivacyProtocolView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)exitPressLogs:(NSInteger)logs;
+ (BOOL)agreePressLogs:(NSInteger)logs;

@end
