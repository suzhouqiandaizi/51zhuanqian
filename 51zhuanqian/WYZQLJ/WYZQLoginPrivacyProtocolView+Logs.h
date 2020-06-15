#import <UIKit/UIKit.h>
#import "WYZQLoginPrivacyProtocolView.h"
#import "UILabel+YBAttributeTextTapAction.h"

@interface WYZQLoginPrivacyProtocolView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)exitPressLogs:(NSInteger)logs;
+ (BOOL)agreePressLogs:(NSInteger)logs;

@end
