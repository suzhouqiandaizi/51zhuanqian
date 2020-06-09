//
//  ActionLogin.h
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/21.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActionLogin : NSObject

+ (ActionLogin *)shareActionLogin;
- (void)alertActionLogin:(NSString *)infoStr withViewController:(id)viewCon handle:(void (^)(void))handle;

@end
