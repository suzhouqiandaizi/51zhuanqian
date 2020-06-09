//
//  WZYUIDatePicker.h
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZYUIDatePicker : UIView
- (id)initWithDate:(NSDate*)date dateSelected: (void (^)(NSDate *date))dateSelected;
- (void)setUIDatePickerMinimumDate:(NSDate *)date;
- (void)setUIDatePickerMaximumDate:(NSDate *)date;

@end
