#import <UIKit/UIViewController.h>
#import "IQUIViewController+Additions.h"
#import <UIKit/NSLayoutConstraint.h>
#import <objc/runtime.h>

@interface UIViewController (AdditionsLogs)
+ (BOOL)setIQLayoutGuideConstraintLogs:(NSInteger)logs;
+ (BOOL)IQLayoutGuideConstraintLogs:(NSInteger)logs;

@end
