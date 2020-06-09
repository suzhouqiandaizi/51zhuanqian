#import <UIKit/UIKit.h>
#import "SJAVMediaPresentView.h"
#import "SJAVMediaPresentController.h"

@interface SJAVMediaPresentController (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)presentViewReadyForDisplayDidChangeLogs:(NSInteger)logs;
+ (BOOL)keyPresentViewLogs:(NSInteger)logs;
+ (BOOL)setVideoGravityLogs:(NSInteger)logs;
+ (BOOL)insertPresentViewToBackLogs:(NSInteger)logs;
+ (BOOL)removePresentViewLogs:(NSInteger)logs;
+ (BOOL)makeKeyPresentViewLogs:(NSInteger)logs;
+ (BOOL)removeAllPresentViewLogs:(NSInteger)logs;

@end
