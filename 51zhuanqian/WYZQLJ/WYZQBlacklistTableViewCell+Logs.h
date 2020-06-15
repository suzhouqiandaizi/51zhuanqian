#import <UIKit/UIKit.h>
#import "WYZQBlacklistTableViewCell.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "AppDelegate.h"

@interface WYZQBlacklistTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs;
+ (BOOL)cancelPressLogs:(NSInteger)logs;

@end
