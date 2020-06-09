#import <Foundation/Foundation.h>
@interface logsSJSafeQueueI: NSObject
+ (BOOL)cinit:(NSInteger)logs;
+ (BOOL)VEnqueue:(NSInteger)logs;
+ (BOOL)Edequeue:(NSInteger)logs;
+ (BOOL)qempty:(NSInteger)logs;

@end
