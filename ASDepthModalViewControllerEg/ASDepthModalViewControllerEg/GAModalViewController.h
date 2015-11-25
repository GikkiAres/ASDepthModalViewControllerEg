//
//  GAModalViewController.h
//  ASDepthModalViewControllerEg
//
//  Created by oftenfull on 15/11/24.
//  Copyright © 2015年 GikkiAres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GAModalViewController : UIViewController

//@property (nonatomic,strong) UIViewController *vcPre;

+ (void)presentView:(UIView *)view;
+ (void)dismiss;

@end
