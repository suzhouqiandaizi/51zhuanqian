#import <UIKit/UIKit.h>
#import "BWRZQTaskObject.h"
#import "BWRZQHomeTableViewCell.h"
#import "GlobalFunction.h"

@interface BWRZQHomeTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;

@end
