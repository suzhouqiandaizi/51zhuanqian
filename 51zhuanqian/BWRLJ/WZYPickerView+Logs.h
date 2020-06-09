#import <UIKit/UIKit.h>
#import "WZYPickerView.h"

@interface WZYPickerView (Logs)
+ (BOOL)sharedViewLogs:(NSInteger)logs;
+ (BOOL)showPickerViewInViewWithstringsWithoptionsCompletionLogs:(NSInteger)logs;
+ (BOOL)showPickerViewInViewWithobjectsWithoptionsObjecttostringconverterCompletionLogs:(NSInteger)logs;
+ (BOOL)dismissWithCompletionLogs:(NSInteger)logs;
+ (BOOL)dismissLogs:(NSInteger)logs;
+ (BOOL)cancelLogs:(NSInteger)logs;
+ (BOOL)removePickerViewLogs:(NSInteger)logs;
+ (BOOL)setPickerHiddenCallbackLogs:(NSInteger)logs;
+ (BOOL)initializePickerViewInViewWitharrayWithoptionsLogs:(NSInteger)logs;
+ (BOOL)numberOfComponentsInPickerViewLogs:(NSInteger)logs;
+ (BOOL)pickerViewNumberofrowsincomponentLogs:(NSInteger)logs;
+ (BOOL)pickerViewTitleforrowForcomponentLogs:(NSInteger)logs;
+ (BOOL)pickerViewDidselectrowIncomponentLogs:(NSInteger)logs;
+ (BOOL)selectedObjectLogs:(NSInteger)logs;
+ (BOOL)pickerViewViewforrowForcomponentReusingviewLogs:(NSInteger)logs;

@end
