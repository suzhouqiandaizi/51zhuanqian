@protocol updateLocationDelegate <NSObject>
-(void)updateLocationWithCity:(NSString*)city displayAlert:(BOOL)alert;
-(void)updateLocationFailed;
@end
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface BWRZQXNLocationManager : NSObject<CLLocationManagerDelegate>
@property(nonatomic,retain)CLLocationManager *locationManager;
@property (nonatomic, weak) id <updateLocationDelegate> delegate;
-(void)locationStart;
@end
