//
//  UpdateAlertView.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2020/5/19.
//  Copyright © 2020 WangZhenyu. All rights reserved.
//

#import "UpdateAlertView.h"

@interface UpdateAlertView(){
    NSDictionary *dic;
}
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UIButton *surebtn;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@end

@implementation UpdateAlertView

- (id)initItem:(NSDictionary *)contentDic{
    self = [[[NSBundle mainBundle] loadNibNamed:@"UpdateAlertView" owner:self options:nil] lastObject];
    if (self) {
        [self setFrame:CGRectMake(0, 0, SCREEN_WIDTH_DEVICE, SCREEN_HEIGHT_DEVICE)];
        dic = contentDic;
        self.showView.layer.masksToBounds = YES;
        self.showView.layer.cornerRadius = 10.0f;
        self.surebtn.layer.masksToBounds = YES;
        self.surebtn.layer.cornerRadius = 5.0f;
        
        NSString *contentStr = [contentDic objectForKey:@"content"];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:4];
        CGSize labelSize = [contentStr boundingRectWithSize:CGSizeMake(290 - 30, MAX_INPUT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentStr];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentStr length])];
        self.contentLabel.attributedText = attributedString;
        [self.contentLabel setFrame:CGRectMake(15, 125, 260, labelSize.height + 20)];
        [self.showView setFrame:CGRectMake((SCREEN_WIDTH_DEVICE - 290)/2.0, (SCREEN_HEIGHT_DEVICE - self.contentLabel.frame.size.height - 220)/2.0, 290, self.contentLabel.frame.size.height + 220)];
    }
    return self;
}

- (IBAction)removePress {
    [self removeFromSuperview];
}

- (IBAction)surePress {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[dic objectForKey:@"download"]]];
    [self removeFromSuperview];
}
@end
