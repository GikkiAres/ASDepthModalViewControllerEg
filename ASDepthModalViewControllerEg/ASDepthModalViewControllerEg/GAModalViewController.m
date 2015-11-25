//
//  GAModalViewController.m
//  ASDepthModalViewControllerEg
//
//  Created by oftenfull on 15/11/24.
//  Copyright © 2015年 GikkiAres. All rights reserved.
//

#import "GAModalViewController.h"
#import "UIImage+Blur.h"

@interface GAModalViewController ()<
UIGestureRecognizerDelegate
>

@property (nonatomic,strong) UIViewController *vcPre;
@property (nonatomic,strong) UIImageView *iv;
@property (nonatomic,strong) UIView *viewPop;

@end

@implementation GAModalViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

+ (void)presentView:(UIView *)view {
  //1 获取当前app的window,创建GAModalViewController,将当前vc的view加入其view.
  UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
  GAModalViewController *vc= [GAModalViewController new];
  vc.vcPre = keyWindow.rootViewController;
  [vc.view addSubview:vc.vcPre.view];
  
  //2 创建当前显示vc的模糊截图并加入vc.view中
  UIImage *image = [UIImage imageFromScreenshotOfView:keyWindow.rootViewController.view];
  UIImage *imageBlur = [image boxblurImageWithBlur:0.5];
  UIImageView *iv = [[UIImageView alloc]initWithFrame:vc.view.bounds];
  iv.image = imageBlur;
  vc.iv = iv;
  iv.userInteractionEnabled = YES;
  [vc.vcPre.view addSubview:iv];
  //
  
  //3 调整要显示的view的大小后加入vc.view
  CGRect rc = CGRectZero;
//  rc.size.height = 300;
//  rc.size.width = 300;
  rc.size.height = 150;
  rc.size.width = 150;
  view.frame = rc;
  
  //[view layoutIfNeeded];
  //view.layoutGuides
  //中心对齐
  view.center = vc.view.center;
  [vc.view addSubview:view];
  
  //5 增加手势,点击GAVC除了要显示的view之外的其他部分消失
  UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
  tapGesture.delegate = vc;
  [vc.iv addGestureRecognizer:tapGesture];
  
  //6 动画和显示
  //要显示的view
  vc.viewPop.transform = CGAffineTransformMakeScale(0.1, 0.1);
  vc.viewPop.alpha = 0;
  vc.iv.alpha = 1;
  [UIView animateWithDuration:0.5
                   animations:^{
                     vc.viewPop.alpha = 1;
                     vc.iv.alpha = 1;
                     vc.viewPop.transform = CGAffineTransformIdentity;
                   }];
  keyWindow.rootViewController = vc;
}

+ (void)dismiss{
  UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
  GAModalViewController * vc = (GAModalViewController *)keyWindow.rootViewController;
  [UIView animateWithDuration:0.5 animations:^{
    vc.viewPop.alpha = 0;
    vc.iv.alpha = 1;
    vc.viewPop.transform = CGAffineTransformMakeScale(0.1, 0.1);
  } completion:^(BOOL finished) {
    [vc.viewPop removeFromSuperview];
    [vc.iv removeFromSuperview];
    [vc.vcPre.view removeFromSuperview];
    keyWindow.rootViewController = vc.vcPre;
  }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
  
  if (touch.view == self.iv)
    return YES;
  return NO;
}


@end
