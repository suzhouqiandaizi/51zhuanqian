#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "BWRZQXNLocationManager.h"

@interface BWRZQXNLocationManager (Logs)
+ (BOOL)locationStartLogs:(NSInteger)logs;
+ (BOOL)locationManagerDidupdatelocationsLogs:(NSInteger)logs;
+ (BOOL)locationManagerDidfailwitherrorLogs:(NSInteger)logs;

@end
