#import <UIKit/UIKit.h>
#import "BWRZQFaBuChooseTypeViewController.h"
#import "BWRZQFaBuFillInViewController.h"
#import "BWRZQFaBuChooseTypeCollectionViewCell.h"
#import "BWRZQFaBuFillInTwoViewController.h"
#import "GlobalFunction.h"
#import "LoadConfig.h"

@interface BWRZQFaBuChooseTypeViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)configCollectionViewLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)collectionViewNumberofitemsinsectionLogs:(NSInteger)logs;
+ (BOOL)collectionViewCellforitematindexpathLogs:(NSInteger)logs;
+ (BOOL)collectionViewViewforsupplementaryelementofkindAtindexpathLogs:(NSInteger)logs;

@end
