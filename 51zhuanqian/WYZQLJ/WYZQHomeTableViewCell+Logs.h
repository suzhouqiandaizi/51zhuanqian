#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
#import "WYZQHomeTableViewCell.h"
#import "GlobalFunction.h"

@interface WYZQHomeTableViewCell (Logs)
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)setSelectedAnimatedLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;

@end
