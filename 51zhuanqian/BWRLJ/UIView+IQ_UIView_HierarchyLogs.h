#import <UIKit/UIView.h>
#import "IQKeyboardManagerConstants.h"
#import "IQUIView+Hierarchy.h"
#import "IQUITextFieldView+Additions.h"
#import <UIKit/UICollectionView.h>
#import <UIKit/UIAlertController.h>
#import <UIKit/UITableView.h>
#import <UIKit/UITextView.h>
#import <UIKit/UITextField.h>
#import <UIKit/UISearchBar.h>
#import <UIKit/UIViewController.h>
#import <UIKit/UIWindow.h>
#import <objc/runtime.h>
#import "IQNSArray+Sort.h"

@interface UIView (IQ_UIView_HierarchyLogs)
+ (BOOL)viewControllerLogs:(NSInteger)logs;
+ (BOOL)topMostControllerLogs:(NSInteger)logs;
+ (BOOL)superviewOfClassTypeLogs:(NSInteger)logs;
+ (BOOL)_IQcanBecomeFirstResponderLogs:(NSInteger)logs;
+ (BOOL)responderSiblingsLogs:(NSInteger)logs;
+ (BOOL)deepResponderViewsLogs:(NSInteger)logs;
+ (BOOL)convertTransformToViewLogs:(NSInteger)logs;
+ (BOOL)depthLogs:(NSInteger)logs;
+ (BOOL)subHierarchyLogs:(NSInteger)logs;
+ (BOOL)superHierarchyLogs:(NSInteger)logs;
+ (BOOL)debugHierarchyLogs:(NSInteger)logs;
+ (BOOL)isSearchBarTextFieldLogs:(NSInteger)logs;
+ (BOOL)isAlertViewTextFieldLogs:(NSInteger)logs;

@end
