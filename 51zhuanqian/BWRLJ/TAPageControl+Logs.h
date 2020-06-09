#import <UIKit/UIKit.h>
#import "TAPageControl.h"
#import "TAAbstractDotView.h"
#import "TAAnimatedDotView.h"
#import "TADotView.h"

@interface TAPageControl (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)initWithCoderLogs:(NSInteger)logs;
+ (BOOL)initializationLogs:(NSInteger)logs;
+ (BOOL)touchesBeganWitheventLogs:(NSInteger)logs;
+ (BOOL)sizeToFitLogs:(NSInteger)logs;
+ (BOOL)sizeForNumberOfPagesLogs:(NSInteger)logs;
+ (BOOL)updateDotsLogs:(NSInteger)logs;
+ (BOOL)updateFrameLogs:(NSInteger)logs;
+ (BOOL)updateDotFrameAtindexLogs:(NSInteger)logs;
+ (BOOL)generateDotViewLogs:(NSInteger)logs;
+ (BOOL)changeActivityAtindexLogs:(NSInteger)logs;
+ (BOOL)resetDotViewsLogs:(NSInteger)logs;
+ (BOOL)hideForSinglePageLogs:(NSInteger)logs;
+ (BOOL)setNumberOfPagesLogs:(NSInteger)logs;
+ (BOOL)setSpacingBetweenDotsLogs:(NSInteger)logs;
+ (BOOL)setCurrentPageLogs:(NSInteger)logs;
+ (BOOL)setDotImageLogs:(NSInteger)logs;
+ (BOOL)setCurrentDotImageLogs:(NSInteger)logs;
+ (BOOL)setDotViewClassLogs:(NSInteger)logs;
+ (BOOL)dotsLogs:(NSInteger)logs;
+ (BOOL)dotSizeLogs:(NSInteger)logs;

@end
