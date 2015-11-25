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
#import "UIImage+Blur.h"
#import "GAModalViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iv1;
@property (weak, nonatomic) IBOutlet UIImageView *iv2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

  //加上一层UIImageView依然可以点击按钮,因为iv的userInteractive默认是false的.事件被穿透了.
  UIImageView *iv = [[UIImageView alloc]initWithFrame:self.view.bounds];
  UIView *viewTest = [[UIView alloc]initWithFrame:CGRectMake(0, 380, 100, 100)];
  UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler)];
  [self.view addSubview:viewTest];
  viewTest.backgroundColor = [UIColor redColor];
  [self.view addGestureRecognizer:gr];
  [self.view addSubview:iv];
}

- (void)tapHandler {
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
  NSLog(@"%@",[UIApplication sharedApplication].keyWindow.rootViewController);
  
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  kShowProcedureStart;
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  kShowProcedureEnd;
  return self;
  
  
}

- (IBAction)clickPop:(id)sender {
  PopView *view = [[[NSBundle mainBundle]loadNibNamed:@"PopView" owner:nil options:nil]lastObject];
#warning ToStudy
//  UIWindow *window = [UIApplication sharedApplication].keyWindow;
//  ViewController *vc = [[ViewController alloc]init];
//  vc.view.backgroundColor = [UIColor orangeColor];
//  [self.view addSubview:vc.view];
//  //window.rootViewController = vc;
//  [window.rootViewController presentViewController:vc animated:YES completion:nil];
  CGRect rc = CGRectZero;
  //  rc.size.height = 300;
  //  rc.size.width = 300;
  rc.size.height = 150;
  rc.size.width = 150;
  view.frame = rc;
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
- (IBAction)showImage1:(id)sender {
  _iv1.image = [UIImage imageNamed:@"saber2.jpg"];
}
- (IBAction)showIv2:(id)sender {
  _iv2.image = [UIImage imageFromScreenshotOfView:_iv1];
}
- (IBAction)showIv2Bluer:(id)sender {
  _iv2.image = [_iv2.image boxblurImageWithBlur:1];
}
- (IBAction)GAPop:(id)sender {
//  UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//  view.backgroundColor = [UIColor orangeColor];
  PopView *view = [[[NSBundle mainBundle]loadNibNamed:@"PopView" owner:nil options:nil]lastObject];
  [GAModalViewController presentView:view];
}

@end
