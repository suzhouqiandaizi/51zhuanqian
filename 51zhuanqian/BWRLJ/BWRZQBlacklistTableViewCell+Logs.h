#import <UIKit/UIKit.h>
#import "BWRZQBlacklistTableViewCell.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "AppDelegate.h"

@interface BWRZQBlacklistTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs;
+ (BOOL)cancelPressLogs:(NSInteger)logs;

@end
