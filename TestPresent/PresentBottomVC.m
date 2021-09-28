//
//  PresentBottomVC.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/14.
//

#import "PresentBottomVC.h"
#import "TestPresentationController.h"

@interface PresentBottomVC ()

@end

@implementation PresentBottomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *red = [[UIView alloc] init];
    red.frame = CGRectMake(0.0, 0.0, 500, 500);
    [red setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:red];
}


@end
