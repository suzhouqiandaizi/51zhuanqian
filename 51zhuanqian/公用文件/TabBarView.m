//
//  TabBarView.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "TabBarView.h"
#import "AppDelegate.h"
#import "SharedViewControllers.h"
#import "WYZQHomeViewController.h"
#import "WYZQTuiGuangViewController.h"
#import "WYZQPersonViewController.h"
#import "WYZQLoginViewController.h"
#import "LoadConfig.h"

#define BTN_X_OFF               0                           //按钮离顶部以及底部的距离
#define BTN_Y_OFF               0                           //两端按钮离边框的距离
#define BTN_WIDTH               SCREEN_WIDTH_DEVICE/3       //按钮宽度
#define BTN_HEIGHT              50                          //按钮高度

@interface TabBarView(){
}

@property (strong, nonatomic) UIButton                  *btnOne;
@property (strong, nonatomic) UIButton                  *btnThree; //推广
@property (strong, nonatomic) UIButton                  *btnFour;

@end

@implementation TabBarView

+ (TabBarView *)sharedTabBarView{
    static TabBarView *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[TabBarView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT_DEVICE - 50 - IS_iPhoneX_Bottom, SCREEN_WIDTH_DEVICE, 50 + IS_iPhoneX_Bottom)];
        
    });
    return _sharedInstance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        
        // Initialization code
//        self.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1];
        self.backgroundColor = [UIColor whiteColor];
        //添加底部线条
        UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, 0.5)];
        [lineImageView setBackgroundColor:RGBACOLOR(179, 179, 179, 1)];
        [self addSubview:lineImageView];
        
        
        
        if (!self.btnOne) {
            self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.btnOne addTarget:self action:@selector(doBtnOne:) forControlEvents:UIControlEventTouchUpInside];
            
            if ([[[[LoadConfig shareStance] getConfig] objectForKey:@"releaseTask"] isEqualToString:@"NO"]) {
                self.btnOne.frame = CGRectMake(0, BTN_Y_OFF, SCREEN_WIDTH_DEVICE/2, BTN_HEIGHT);
            }else{
                self.btnOne.frame = CGRectMake(BTN_X_OFF, BTN_Y_OFF, BTN_WIDTH, BTN_HEIGHT);
            }
            [self.btnOne setImage:[UIImage imageNamed:@"renwu_n_btn"] forState:UIControlStateNormal];
            [self.btnOne setImage:[UIImage imageNamed:@"renwu_s_btn"] forState:UIControlStateHighlighted];
            [self.btnOne setImage:[UIImage imageNamed:@"renwu_s_btn"] forState:UIControlStateSelected];
            [self addSubview:self.btnOne];
            
        }
        if (!self.btnThree) {
            self.btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.btnThree addTarget:self action:@selector(doBtnThree:) forControlEvents:UIControlEventTouchUpInside];
            self.btnThree.frame = CGRectMake(BTN_WIDTH, BTN_Y_OFF, BTN_WIDTH, BTN_HEIGHT);
            [self.btnThree setImage:[UIImage imageNamed:@"tuiguang_n_btn"] forState:UIControlStateNormal];
            [self.btnThree setImage:[UIImage imageNamed:@"tuiguang_s_btn"] forState:UIControlStateHighlighted];
            [self.btnThree setImage:[UIImage imageNamed:@"tuiguang_s_btn"] forState:UIControlStateSelected];
            [self addSubview:self.btnThree];
            if ([[[[LoadConfig shareStance] getConfig] objectForKey:@"releaseTask"] isEqualToString:@"NO"]) {
                self.btnThree.hidden = YES;
            }else{
                self.btnThree.hidden = NO;
            }
        }
        
        if (!self.btnFour) {
            self.btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.btnFour addTarget:self action:@selector(doBtnFour:) forControlEvents:UIControlEventTouchUpInside];
            if ([[[[LoadConfig shareStance] getConfig] objectForKey:@"releaseTask"] isEqualToString:@"NO"]) {
                self.btnFour.frame = CGRectMake(SCREEN_WIDTH_DEVICE/2, BTN_Y_OFF, SCREEN_WIDTH_DEVICE/2, BTN_HEIGHT);
            }else{
                self.btnFour.frame = CGRectMake(BTN_WIDTH * 2, BTN_Y_OFF, BTN_WIDTH, BTN_HEIGHT);
            }
            
            [self.btnFour setImage:[UIImage imageNamed:@"wo_n_btn"] forState:UIControlStateNormal];
            [self.btnFour setImage:[UIImage imageNamed:@"wo_s_btn"] forState:UIControlStateHighlighted];
            [self.btnFour setImage:[UIImage imageNamed:@"wo_s_btn"] forState:UIControlStateSelected];
            [self addSubview:self.btnFour];
        }
    }
    return self;
}

- (void)setCurrentViewControllerIndex:(NSInteger)index{
    [self.btnOne setSelected:NO];
    [self.btnThree setSelected:NO];
    [self.btnFour setSelected:NO];
    switch (index) {
        case 1:
            [self.btnOne setSelected:YES];
            break;
        case 2:
            [self.btnThree setSelected:YES];
            break;
        case 3:
            [self.btnFour setSelected:YES];
            break;
        default:
            break;
    }
}

- (void)doBtnOne:(id)sender {
    if (!self.btnOne.selected) {
        WYZQHomeViewController *kViewCon = [SharedViewControllers homeViewCon];
        AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        if ([del.navigationController.viewControllers containsObject:kViewCon]) {
            [del.navigationController popToViewController:kViewCon animated:NO];
        }else {
            [del.navigationController pushViewController:kViewCon animated:NO];
        }
    }
}

- (void)doBtnThree:(id)sender {
    if (!self.btnThree.selected) {
        if ([UserManger hasUserLogged]) {
            WYZQTuiGuangViewController *kViewCon = [SharedViewControllers tuiguangViewCon];
            AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            if ([del.navigationController.viewControllers containsObject:kViewCon]) {
                [del.navigationController popToViewController:kViewCon animated:NO];
            }else {
                [del.navigationController pushViewController:kViewCon animated:NO];
            }
        }else{
            [self loginPress];
        }
    }
}

- (void)doBtnFour:(id)sender {
    if (!self.btnFour.selected) {
        if ([UserManger hasUserLogged]) {
            WYZQPersonViewController *kViewCon = [SharedViewControllers personViewCon];
            AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            if ([del.navigationController.viewControllers containsObject:kViewCon]) {
                [del.navigationController popToViewController:kViewCon animated:NO];
            }else {
                [del.navigationController pushViewController:kViewCon animated:NO];
            }
        }else{
            [self loginPress];
        }
        
    }
}

- (void)loginPress{
    WYZQLoginViewController *viewCon = [[WYZQLoginViewController alloc] initWithNibName:@"WYZQLoginViewController" bundle:nil];
    CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
    navCon.modalPresentationStyle = UIModalPresentationFullScreen;
    AppDelegate *del = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [del.navigationController presentViewController:navCon animated:YES completion:nil];
}
@end
