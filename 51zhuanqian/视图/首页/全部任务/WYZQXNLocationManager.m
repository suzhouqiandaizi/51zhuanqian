#import "WYZQXNLocationManager.h"
#define     MAX_COMMON_CITY_NUMBER      8
#define     COMMON_CITY_DATA_KEY        @"GYZCommonCityArray"
#define IOS8 [[[UIDevice currentDevice] systemVersion]floatValue]>=8.0
@implementation WYZQXNLocationManager
-(void)locationStart{
    if([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init] ;
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;
        if (IOS8) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        [self.locationManager startUpdatingLocation];
    }else {
        NSLog(@"%@",@"定位服务可能尚未打开，请在设置打开！");
    }
}
#pragma mark - CoreLocation Delegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self.locationManager stopUpdatingLocation];
    self.locationManager = nil;
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *array, NSError *error)
     {
         if (array.count >0)
         {
             CLPlacemark *placemark = [array objectAtIndex:0];
             NSString *currCity = placemark.locality;
             if (!currCity) {
                 currCity = placemark.administrativeArea;
             }
             [self->_delegate updateLocationWithCity:currCity displayAlert:NO];
         } else if (error ==nil && [array count] == 0)
         {
             NSLog(@"No results were returned.");
             [self.delegate updateLocationFailed];
         }else if (error !=nil)
         {
             NSLog(@"An error occurred = %@", error);
             [self.delegate updateLocationFailed];
         }
     }];
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    [self.delegate updateLocationFailed];
    if (error.code ==kCLErrorDenied) {
    }
}
@end
