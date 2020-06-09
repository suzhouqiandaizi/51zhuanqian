#import "IQKeyboardManagerConstants.h"
#import <UIKit/UITextView.h>
#import "IQTextView.h"
#import <UIKit/NSTextContainer.h>
#import <UIKit/UILabel.h>
#import <UIKit/UINibLoading.h>

@interface IQTextView (Logs)
+ (BOOL)initializeLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)awakeFromNibLogs:(NSInteger)logs;
+ (BOOL)refreshPlaceholderLogs:(NSInteger)logs;
+ (BOOL)setTextLogs:(NSInteger)logs;
+ (BOOL)setFontLogs:(NSInteger)logs;
+ (BOOL)setTextAlignmentLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)setPlaceholderLogs:(NSInteger)logs;
+ (BOOL)delegateLogs:(NSInteger)logs;

@end
