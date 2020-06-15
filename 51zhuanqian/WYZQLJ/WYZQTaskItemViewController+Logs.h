#import <UIKit/UIKit.h>
#import "WYZQTaskItemViewController.h"
#import "MJRefresh.h"
#import "WYZQHomeTableViewCell.h"
#import "RefreshErrorAlertView.h"
#import "WYZQTaskDetailTwoViewController.h"
#import "WYZQTaskVideoPlayerViewController.h"
#import "WYZQTaskReadViewController.h"
#import <TJSDK/TJSDK.h>
#import <MapKit/MapKit.h>
#import "WYZQXNLocationManager.h"
#import <DyAdSdk/DyAdApi.h>

@interface WYZQTaskItemViewController (Logs)
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
