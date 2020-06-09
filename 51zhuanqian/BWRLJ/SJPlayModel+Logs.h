#import <UIKit/UIKit.h>
#import "SJPlayModel.h"

@interface SJPlayModel (Logs)
+ (BOOL)UIViewPlayModelLogs:(NSInteger)logs;
+ (BOOL)UITableViewCellPlayModelWithPlayerSuperviewTagAtindexpathTableviewLogs:(NSInteger)logs;
+ (BOOL)UICollectionViewCellPlayModelWithPlayerSuperviewTagAtindexpathCollectionviewLogs:(NSInteger)logs;
+ (BOOL)UITableViewHeaderViewPlayModelWithPlayerSuperviewTableviewLogs:(NSInteger)logs;
+ (BOOL)UICollectionViewNestedInUITableViewHeaderViewPlayModelWithPlayerSuperviewTagAtindexpathCollectionviewTableviewLogs:(NSInteger)logs;
+ (BOOL)UICollectionViewNestedInUITableViewCellPlayModelWithPlayerSuperviewTagAtindexpathCollectionviewtagCollectionviewatindexpathTableviewLogs:(NSInteger)logs;
+ (BOOL)UICollectionViewNestedInUICollectionViewCellPlayModelWithPlayerSuperviewTagAtindexpathCollectionviewtagCollectionviewatindexpathRootcollectionviewLogs:(NSInteger)logs;
+ (BOOL)UITableViewHeaderFooterViewPlayModelWithPlayerSuperviewTagInsectionIsheaderTableviewLogs:(NSInteger)logs;
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)isPlayInTableViewLogs:(NSInteger)logs;
+ (BOOL)isPlayInCollectionViewLogs:(NSInteger)logs;
+ (BOOL)playerSuperviewLogs:(NSInteger)logs;
+ (BOOL)inScrollViewLogs:(NSInteger)logs;

@end
