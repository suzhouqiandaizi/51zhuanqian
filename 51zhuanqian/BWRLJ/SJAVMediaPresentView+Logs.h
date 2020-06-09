#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "SJAVMediaPresentView.h"

@interface SJAVMediaPresentView (Logs)
+ (BOOL)layerClassLogs:(NSInteger)logs;
+ (BOOL)initWithFrameLogs:(NSInteger)logs;
+ (BOOL)initWithFramePlayerLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)observeValueForKeyPathOfobjectChangeContextLogs:(NSInteger)logs;
+ (BOOL)setPlayerLogs:(NSInteger)logs;
+ (BOOL)playerLogs:(NSInteger)logs;
+ (BOOL)isReadyForDisplayLogs:(NSInteger)logs;
+ (BOOL)setVideoGravityLogs:(NSInteger)logs;
+ (BOOL)videoGravityLogs:(NSInteger)logs;

@end
