#import <UIKit/UIKit.h>
#import "WYZQFaBuChooseTypeViewController.h"
#import "WYZQFaBuFillInViewController.h"
#import "WYZQFaBuChooseTypeCollectionViewCell.h"
#import "WYZQFaBuFillInTwoViewController.h"
#import "GlobalFunction.h"
#import "LoadConfig.h"

@interface WYZQFaBuChooseTypeViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)configCollectionViewLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)collectionViewNumberofitemsinsectionLogs:(NSInteger)logs;
+ (BOOL)collectionViewCellforitematindexpathLogs:(NSInteger)logs;
+ (BOOL)collectionViewViewforsupplementaryelementofkindAtindexpathLogs:(NSInteger)logs;

@end
