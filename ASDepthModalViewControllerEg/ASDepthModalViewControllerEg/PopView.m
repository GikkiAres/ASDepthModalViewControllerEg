//
//  PopView.m
//  ASDepthModalViewControllerEg
//
//  Created by GikkiAres on 11/19/15.
//  Copyright © 2015 GikkiAres. All rights reserved.
//

#import "PopView.h"
#import "ASDepthModalViewController.h"
#import "GAModalViewController.h"

@implementation PopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)clickBack:(id)sender {
  UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
  UIViewController * vc = keyWindow.rootViewController;
  if ([vc isMemberOfClass:[GAModalViewController class]]) {
    [GAModalViewController dismiss];
  }
  else [ASDepthModalViewController dismiss];
}

@end
