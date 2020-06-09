//
//  WZYPickerView.h
//  WZYPickerView
//
//  Created by WangZhenyu on 16/12/15.
//  Copyright © 2016年 WangZhenyu. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const MMbackgroundColor;
extern NSString * const MMtextColor;
extern NSString * const MMtoolbarColor;
extern NSString * const MMbuttonColor;
extern NSString * const MMfont;
extern NSString * const MMvalueY;
extern NSString * const MMselectedObject;
extern NSString * const MMtoolbarBackgroundImage;
extern NSString * const MMtextAlignment;
extern NSString * const MMshowsSelectionIndicator;

@interface WZYPickerView: UIView 

+(void)showPickerViewInView: (UIView *)view
                withStrings: (NSArray *)strings
                withOptions: (NSDictionary *)options
                 completion: (void(^)(NSString *selectStr, NSInteger row, BOOL doneBool))completion;

+(void)showPickerViewInView: (UIView *)view
                withObjects: (NSArray *)objects
                withOptions: (NSDictionary *)options
    objectToStringConverter: (NSString *(^)(id object))converter
       completion: (void(^)(id selectedObject, NSInteger row, BOOL doneBool))completion;

+(void)dismissWithCompletion: (void(^)(NSString *selectStr, NSInteger row, BOOL doneBool))completion;

@end
