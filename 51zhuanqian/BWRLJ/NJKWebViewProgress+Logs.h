#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NJKWebViewProgress.h"

@interface NJKWebViewProgress (Logs)
+ (BOOL)initLogs:(NSInteger)logs;
+ (BOOL)startProgressLogs:(NSInteger)logs;
+ (BOOL)incrementProgressLogs:(NSInteger)logs;
+ (BOOL)completeProgressLogs:(NSInteger)logs;
+ (BOOL)setProgressLogs:(NSInteger)logs;
+ (BOOL)resetLogs:(NSInteger)logs;
+ (BOOL)webViewShouldstartloadwithrequestNavigationtypeLogs:(NSInteger)logs;
+ (BOOL)webViewDidStartLoadLogs:(NSInteger)logs;
+ (BOOL)webViewDidFinishLoadLogs:(NSInteger)logs;
+ (BOOL)webViewDidfailloadwitherrorLogs:(NSInteger)logs;
+ (BOOL)respondsToSelectorLogs:(NSInteger)logs;
+ (BOOL)methodSignatureForSelectorLogs:(NSInteger)logs;
+ (BOOL)forwardInvocationLogs:(NSInteger)logs;

@end
