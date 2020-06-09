#import <Foundation/Foundation.h>
#import "SJVideoPlayerPlaybackControllerDefines.h"
#import "SJAVMediaPlaybackController.h"
#import <SJUIKit/SJRunLoopTaskQueue.h>
#import "SJRunLoopTaskQueue.h"
#import "SJAVMediaPlayer.h"
#import "SJAVMediaPlayerLoader.h" 
#import "SJVideoPlayerRegistrar.h"
#import "AVAsset+SJAVMediaExport.h"
#import "NSTimer+SJAssetAdd.h"
#import "SJAVMediaPresentController.h"
#import "SJAVMediaPlayerDefinitionLoader.h"

@interface SJAVMediaPlaybackController (ExportLogs)
+ (BOOL)exportWithBeginTimeDurationPresetnameProgressCompletionFailureLogs:(NSInteger)logs;
+ (BOOL)cancelExportOperationLogs:(NSInteger)logs;
+ (BOOL)generateGIFWithBeginTimeDurationMaximumsizeIntervalGifsavepathProgressCompletionFailureLogs:(NSInteger)logs;
+ (BOOL)cancelGenerateGIFOperationLogs:(NSInteger)logs;

@end
