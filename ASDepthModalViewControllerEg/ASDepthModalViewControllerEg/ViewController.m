//
//  ViewController.m
//  ASDepthModalViewControllerEg
//
//  Created by GikkiAres on 11/19/15.
//  Copyright © 2015 GikkiAres. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"
#import "ASDepthModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  kShowProcedureStart;
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  kShowProcedureEnd;
  return self;
  
  
}

- (IBAction)clickPop:(id)sender {
  PopView *view = [[[NSBundle mainBundle]loadNibNamed:@"PopView" owner:nil options:nil]lastObject];
  [ASDepthModalViewController presentView:view backgroundColor:nil options:ASDepthModalOptionAnimationGrow completionHandler:nil];
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
