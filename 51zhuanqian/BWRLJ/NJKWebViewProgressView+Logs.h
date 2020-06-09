#import <UIKit/UIKit.h>
#import "NJKWebViewProgressView.h"

@interface NJKWebViewProgressView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)configureViewsLogs:(NSInteger)logs;
+ (BOOL)setProgressColorLogs:(NSInteger)logs;
+ (BOOL)setProgressLogs:(NSInteger)logs;
+ (BOOL)setProgressAnimatedLogs:(NSInteger)logs;

@end
