#import <UIKit/UIKit.h>
#import "SDCollectionViewCell.h"
#import "UIView+SDExtension.h"

@interface SDCollectionViewCell (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)setTitleLabelBackgroundColorLogs:(NSInteger)logs;
+ (BOOL)setTitleLabelTextColorLogs:(NSInteger)logs;
+ (BOOL)setTitleLabelTextFontLogs:(NSInteger)logs;
+ (BOOL)setupImageViewLogs:(NSInteger)logs;
+ (BOOL)setupTitleLabelLogs:(NSInteger)logs;
+ (BOOL)setTitleLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;

@end
