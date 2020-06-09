#import <UIKit/UIKit.h>
#import "SHLineView.h"

@interface SHLineView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)setupViewLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)setBackgroundColorLogs:(NSInteger)logs;
+ (BOOL)line_animationLogs:(NSInteger)logs;
+ (BOOL)font_animationLogs:(NSInteger)logs;
+ (BOOL)validateNumberLogs:(NSInteger)logs;

@end
