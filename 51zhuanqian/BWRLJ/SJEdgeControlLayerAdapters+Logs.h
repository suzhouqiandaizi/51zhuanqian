#import <UIKit/UIKit.h>
#import "SJEdgeControlLayerItemAdapter.h"
#import "SJVideoPlayerControlMaskView.h"
#import <Masonry/Masonry.h>
#import "Masonry.h"
#import <SJUIKit/SJAttributesFactory.h>
#import "SJAttributesFactory.h"
#import "SJVideoPlayerControlMaskView.h"
#import "SJEdgeControlLayerAdapters.h"

@interface SJEdgeControlLayerAdapters (Logs)
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)isFitOnScreenLogs:(NSInteger)logs;
+ (BOOL)layoutSubviewsLogs:(NSInteger)logs;
+ (BOOL)_updateLayout_isNormal_iPhone_XLogs:(NSInteger)logs;
+ (BOOL)_updateLayout_isFullScreen_iPhone_XLogs:(NSInteger)logs;
+ (BOOL)_observeOrientationChangeOfStatusBarNotifyLogs:(NSInteger)logs;
+ (BOOL)_updateTopLayoutLogs:(NSInteger)logs;
+ (BOOL)topContainerViewLogs:(NSInteger)logs;
+ (BOOL)leftContainerViewLogs:(NSInteger)logs;
+ (BOOL)bottomContainerViewLogs:(NSInteger)logs;
+ (BOOL)rightContainerViewLogs:(NSInteger)logs;
+ (BOOL)centerContainerViewLogs:(NSInteger)logs;
+ (BOOL)topAdapterLogs:(NSInteger)logs;
+ (BOOL)leftAdapterLogs:(NSInteger)logs;
+ (BOOL)bottomAdapterLogs:(NSInteger)logs;
+ (BOOL)rightAdapterLogs:(NSInteger)logs;
+ (BOOL)centerAdapterLogs:(NSInteger)logs;
+ (BOOL)setTopHeightLogs:(NSInteger)logs;
+ (BOOL)setLeftWidthLogs:(NSInteger)logs;
+ (BOOL)setBottomHeightLogs:(NSInteger)logs;
+ (BOOL)setRightWidthLogs:(NSInteger)logs;
+ (BOOL)setTopMarginLogs:(NSInteger)logs;
+ (BOOL)setLeftMarginLogs:(NSInteger)logs;
+ (BOOL)setBottomMarginLogs:(NSInteger)logs;
+ (BOOL)setRightMarginLogs:(NSInteger)logs;

@end
