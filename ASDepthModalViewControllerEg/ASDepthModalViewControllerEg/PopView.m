//
//  PopView.m
//  ASDepthModalViewControllerEg
//
//  Created by GikkiAres on 11/19/15.
//  Copyright © 2015 GikkiAres. All rights reserved.
//

#import "PopView.h"
#import "ASDepthModalViewController.h"

@implementation PopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)clickBack:(id)sender {
  [ASDepthModalViewController dismiss];
}

@end
