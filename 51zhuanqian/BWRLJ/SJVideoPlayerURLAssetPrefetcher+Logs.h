#import <Foundation/Foundation.h>
#import "SJVideoPlayerURLAsset.h"
#import "SJVideoPlayerURLAssetPrefetcher.h"
#import "SJAVMediaPlayerLoader.h"

@interface SJVideoPlayerURLAssetPrefetcher (Logs)
+ (BOOL)sharedLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)prefetchAssetLogs:(NSInteger)logs;
+ (BOOL)assetForURLLogs:(NSInteger)logs;
+ (BOOL)assetForIdentifierLogs:(NSInteger)logs;
+ (BOOL)removeAssetLogs:(NSInteger)logs;
+ (BOOL)_indexOfAssetLogs:(NSInteger)logs;

@end
