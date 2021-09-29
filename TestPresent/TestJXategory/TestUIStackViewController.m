//
//  TestUIStackViewController.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/29.
//

#import "TestUIStackViewController.h"

@interface TestUIStackViewController ()

@end

@implementation TestUIStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [self createView:[UIColor redColor]];
    UIView *yellowView = [self createView:[UIColor yellowColor]];
    UIView *greenView = [self createView:[UIColor greenColor]];
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[
        redView,
        yellowView,
        greenView
    ]];
    [stackView setAxis:UILayoutConstraintAxisHorizontal];
    [stackView setAlignment:UIStackViewAlignmentCenter];
    [stackView setDistribution:UIStackViewDistributionEqualSpacing];
    [self.contentScrollView addSubview:stackView];


    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.left.mas_offset(10);
        make.right.mas_offset(-10).priorityHigh();
        make.height.mas_equalTo(70);
        // !!!: stackView 在做 autolayout 於 UIScroll裡面時，需要設置一個制中，它才會正常
        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.width.mas_lessThanOrEqualTo(self.contentScrollView.mas_width);
    }];

    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];

    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(redView);
    }];

    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(redView);
    }];
}

- (UIView *)createView:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 50, 50)];
    [view setBackgroundColor:color];
    return view;
}


@end
