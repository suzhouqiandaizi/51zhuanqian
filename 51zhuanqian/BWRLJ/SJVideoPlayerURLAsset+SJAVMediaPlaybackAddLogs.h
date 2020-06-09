#import "SJVideoPlayerURLAsset.h"
#import <AVFoundation/AVFoundation.h>
#import "SJPlayModel.h"
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJVideoPlayerURLAsset+SJAVMediaPlaybackAdd.h"
#import <objc/message.h>

@interface SJVideoPlayerURLAsset (SJAVMediaPlaybackAddLogs)
+ (BOOL)initWithAVAssetLogs:(NSInteger)logs;
+ (BOOL)initWithAVAssetPlaymodelLogs:(NSInteger)logs;
+ (BOOL)initWithAVAssetSpecifystarttimePlaymodelLogs:(NSInteger)logs;
+ (BOOL)setAvAssetLogs:(NSInteger)logs;
+ (BOOL)avAssetLogs:(NSInteger)logs;

@end
