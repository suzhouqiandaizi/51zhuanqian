#import <UIKit/UIKit.h>
#import "SJVideoPlayerDraggingProgressView.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import "SJProgressSlider.h"
#import "UIView+SJVideoPlayerSetting.h"

@interface SJVideoPlayerDraggingProgressView (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)setStyleLogs:(NSInteger)logs;
+ (BOOL)_needUpdateToStyleLogs:(NSInteger)logs;
+ (BOOL)setMaxValueLogs:(NSInteger)logs;
+ (BOOL)setCurrentTimeLogs:(NSInteger)logs;
+ (BOOL)setProgressTimeStrLogs:(NSInteger)logs;
+ (BOOL)setProgressTimeLogs:(NSInteger)logs;
+ (BOOL)setProgressTimeStrTotaltimestrLogs:(NSInteger)logs;
+ (BOOL)setPreviewImageLogs:(NSInteger)logs;
+ (BOOL)_setupViewsLogs:(NSInteger)logs;
+ (BOOL)contentViewLogs:(NSInteger)logs;
+ (BOOL)progressSliderLogs:(NSInteger)logs;
+ (BOOL)directionImageViewLogs:(NSInteger)logs;
+ (BOOL)previewImageViewLogs:(NSInteger)logs;
+ (BOOL)shiftTimeLabelLogs:(NSInteger)logs;
+ (BOOL)separatorLabelLogs:(NSInteger)logs;
+ (BOOL)durationTimeLabelLogs:(NSInteger)logs;
+ (BOOL)_loadSettingsLogs:(NSInteger)logs;

@end
