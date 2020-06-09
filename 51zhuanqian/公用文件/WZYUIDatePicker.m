//
//  WZYUIDatePicker.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "WZYUIDatePicker.h"

@interface WZYUIDatePicker()

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (copy, nonatomic) void (^Handle)(NSDate *dateStr);
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *bgBtn;
@property (weak, nonatomic) IBOutlet UIImageView *lineTopImageView;
@property (nonatomic, strong) UIToolbar *pickerViewToolBar;
@end

@implementation WZYUIDatePicker

- (id)initWithDate:(NSDate *)date dateSelected:(void (^)(NSDate *))dateSelected
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WZYUIDatePicker" owner:self options:nil] lastObject];
    if (self) {
        [self.lineTopImageView setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 0.5)];
        [self.bgBtn setBackgroundColor:[UIColor colorWithRed:0.412 green:0.412 blue:0.412 alpha:0.6]];
        

        self.alpha = 0;
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        self.datePicker.date = date;
        self.Handle = dateSelected;
        
        [self.bottomView setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.bottomView.frame))];
        
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             [self setAlpha:1.0];
                             [self.bottomView setTransform:CGAffineTransformIdentity];
                         } completion:^(BOOL completed) {
                         }];
    }
    return self;
}

- (IBAction)removePress {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self setAlpha:0.0];
                         [self.bottomView setTransform:CGAffineTransformMakeTranslation(0.0, CGRectGetHeight(self.bottomView.frame))];
                     } completion:^(BOOL completed) {
                         [self removeFromSuperview];
                     }];
}

- (IBAction)surePress {
    NSDate *select = [self.datePicker date];
    self.Handle(select);
    [self removeFromSuperview];
}

- (void)setUIDatePickerMinimumDate:(NSDate *)date{
    self.datePicker.minimumDate = date;
}

- (void)setUIDatePickerMaximumDate:(NSDate *)date{
    self.datePicker.maximumDate = date;
}
@end
