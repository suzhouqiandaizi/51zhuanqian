#import <UIKit/UIKit.h>
#import "UIAlertController+Blocks.h"

@interface UIAlertController (BlocksLogs)
+ (BOOL)showInViewControllerWithtitleMessagePreferredstyleCancelbuttontitleDestructivebuttontitleOtherbuttontitlesPopoverpresentationcontrollerblockTapblockLogs:(NSInteger)logs;
+ (BOOL)showAlertInViewControllerWithtitleMessageCancelbuttontitleDestructivebuttontitleOtherbuttontitlesTapblockLogs:(NSInteger)logs;
+ (BOOL)showActionSheetInViewControllerWithtitleMessageCancelbuttontitleDestructivebuttontitleOtherbuttontitlesPopoverpresentationcontrollerblockTapblockLogs:(NSInteger)logs;
+ (BOOL)visibleLogs:(NSInteger)logs;
+ (BOOL)cancelButtonIndexLogs:(NSInteger)logs;
+ (BOOL)firstOtherButtonIndexLogs:(NSInteger)logs;
+ (BOOL)destructiveButtonIndexLogs:(NSInteger)logs;

@end
