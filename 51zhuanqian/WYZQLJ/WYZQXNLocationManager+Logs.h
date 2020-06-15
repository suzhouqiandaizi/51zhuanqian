#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "WYZQXNLocationManager.h"

@interface WYZQXNLocationManager (Logs)
+ (BOOL)locationStartLogs:(NSInteger)logs;
+ (BOOL)locationManagerDidupdatelocationsLogs:(NSInteger)logs;
+ (BOOL)locationManagerDidfailwitherrorLogs:(NSInteger)logs;

@end
