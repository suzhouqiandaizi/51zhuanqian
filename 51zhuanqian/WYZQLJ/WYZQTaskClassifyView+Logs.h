#import <UIKit/UIKit.h>
#import "WYZQTaskClassifyView.h"
#import "WYZQFaBuChooseTypeCollectionViewCell.h"
#import "GlobalFunction.h"
#import "LoadConfig.h"
#import "WYZQTaskClassifyTableViewCell.h"

@interface WYZQTaskClassifyView (Logs)
+ (BOOL)initItemLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
+ (BOOL)configCollectionViewLogs:(NSInteger)logs;
+ (BOOL)collectionViewNumberofitemsinsectionLogs:(NSInteger)logs;
+ (BOOL)collectionViewCellforitematindexpathLogs:(NSInteger)logs;
+ (BOOL)collectionViewViewforsupplementaryelementofkindAtindexpathLogs:(NSInteger)logs;
+ (BOOL)configTableViewLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)chongzhiPressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;

@end
