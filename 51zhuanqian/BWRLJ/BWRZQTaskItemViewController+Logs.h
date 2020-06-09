#import <UIKit/UIKit.h>
#import "BWRZQTaskItemViewController.h"
#import "MJRefresh.h"
#import "BWRZQHomeTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "BWRZQTaskDetailTwoViewController.h"
#import "BWRZQTaskVideoPlayerViewController.h"
#import "BWRZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import <MapKit/MapKit.h>
#import "BWRZQXNLocationManager.h"
#import <DyAdSdk/DyAdApi.h>

@interface BWRZQTaskItemViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)refreshHeaderLogs:(NSInteger)logs;
+ (BOOL)refreshFooterLogs:(NSInteger)logs;
+ (BOOL)locationManagerLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)tableViewNumberofrowsinsectionLogs:(NSInteger)logs;
+ (BOOL)tableViewCellforrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)tableViewDidselectrowatindexpathLogs:(NSInteger)logs;
+ (BOOL)updateLocationWithCityDisplayalertLogs:(NSInteger)logs;
+ (BOOL)updateLocationFailedLogs:(NSInteger)logs;

@end
