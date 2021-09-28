//
//  ViewController.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/14.
//

#import "ViewController.h"
#import "TestPresentationController.h"
#import "PresentBottomVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:btn];
}

- (void)btnAction {
    PresentBottomVC *vc = [[PresentBottomVC alloc] init];
    [self presentBotton:vc];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    PresentBottomVC *vc = [[PresentBottomVC alloc] init];
    [self presentBotton:vc];
}

- (void)presentBotton:(UIViewController *)vc {
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    TestPresentationController *presentC = [[TestPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentC;
}

@end
