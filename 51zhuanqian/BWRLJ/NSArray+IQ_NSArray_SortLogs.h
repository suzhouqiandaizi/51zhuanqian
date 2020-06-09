#import <Foundation/NSArray.h>
#import "IQNSArray+Sort.h"
#import "IQUIView+Hierarchy.h"
#import <UIKit/UIView.h>

@interface NSArray (IQ_NSArray_SortLogs)
+ (BOOL)sortedArrayByTagLogs:(NSInteger)logs;
+ (BOOL)sortedArrayByPositionLogs:(NSInteger)logs;

@end
