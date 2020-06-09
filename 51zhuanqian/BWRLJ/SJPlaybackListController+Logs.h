#import <Foundation/Foundation.h>
#import "SJPlaybackListControllerProtocol.h"
#import "SJPlaybackListController.h"
#import "SJPlaybackListControllerObserver.h"

@interface SJPlaybackListController (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)getObserverLogs:(NSInteger)logs;
+ (BOOL)indexForMediaIdLogs:(NSInteger)logs;
+ (BOOL)mediaForMediaIdLogs:(NSInteger)logs;
+ (BOOL)mediaAtIndexLogs:(NSInteger)logs;
+ (BOOL)addMediaLogs:(NSInteger)logs;
+ (BOOL)addToTheBackOfCurrentMediaLogs:(NSInteger)logs;
+ (BOOL)addMediasLogs:(NSInteger)logs;
+ (BOOL)replaceMediasLogs:(NSInteger)logs;
+ (BOOL)removeLogs:(NSInteger)logs;
+ (BOOL)removeAllMediasLogs:(NSInteger)logs;
+ (BOOL)currentMediaLogs:(NSInteger)logs;
+ (BOOL)mediasLogs:(NSInteger)logs;
+ (BOOL)changePlaybackModeLogs:(NSInteger)logs;
+ (BOOL)_isSupportedModeLogs:(NSInteger)logs;
+ (BOOL)setModeLogs:(NSInteger)logs;
+ (BOOL)modeLogs:(NSInteger)logs;
+ (BOOL)playPreviousMediaLogs:(NSInteger)logs;
+ (BOOL)playNextMediaLogs:(NSInteger)logs;
+ (BOOL)_randomModePlayNextMediaLogs:(NSInteger)logs;
+ (BOOL)playAtIndexLogs:(NSInteger)logs;
+ (BOOL)currentMediaFinishedPlayingLogs:(NSInteger)logs;
+ (BOOL)_unsafe_indexForMediaIdLogs:(NSInteger)logs;
+ (BOOL)_unsafe_mediaForMediaIdLogs:(NSInteger)logs;
+ (BOOL)_unsafe_addMediaLogs:(NSInteger)logs;
+ (BOOL)_unsafe_mediasIndexformediaidLogs:(NSInteger)logs;
+ (BOOL)_removeDuplicateMediasLogs:(NSInteger)logs;

@end
