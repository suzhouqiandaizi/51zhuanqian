#import <UIKit/UIKit.h>
#import "SJPlayModel.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJVideoPlayerURLAsset.h"
#import <objc/message.h>
#import <SJUIKit/NSObject+SJObserverHelper.h>
#import "NSObject+SJObserverHelper.h"

@interface SJVideoPlayerURLAsset (Logs)
+ (BOOL)initWithURLSpecifystarttimePlaymodelLogs:(NSInteger)logs;
+ (BOOL)initWithURLSpecifystarttimeLogs:(NSInteger)logs;
+ (BOOL)initWithURLPlaymodelLogs:(NSInteger)logs;
+ (BOOL)initWithURLLogs:(NSInteger)logs;
+ (BOOL)initWithOtherAssetPlaymodelLogs:(NSInteger)logs;
+ (BOOL)isM3u8Logs:(NSInteger)logs;
+ (BOOL)playModelLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)originMediaLogs:(NSInteger)logs;

@end
