//
//  TestPresentationController.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/14.
//

#import "TestPresentationController.h"
@interface TestPresentationController()
@property (nonatomic, strong) UIView *blackView;
@end

@implementation TestPresentationController
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    if (self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController]) {
        presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

#pragma mark - Lazy load
- (UIView *)blackView {
    if (!_blackView) {
        _blackView = [[UIView alloc] init];
        _blackView.frame = self.containerView.bounds;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeVC)];
        [self.containerView addGestureRecognizer:tap];
        [_blackView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
    }
    return _blackView;
}

- (CGRect)frameOfPresentedViewInContainerView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return CGRectMake(0, screenHeight - 200, screenWidth, 200);
}

- (void)closeVC {
    [self.presentedViewController dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Override
- (void)presentationTransitionWillBegin {
    [super presentationTransitionWillBegin];
    self.blackView.alpha = 0.0;
    [self.containerView addSubview:self.blackView];
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 1.0;
    }];
}

- (void)dismissalTransitionWillBegin {
    [super dismissalTransitionWillBegin];
    [UIView animateWithDuration:0.5 animations:^{
        self.blackView.alpha = 0.0;
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed) {
        [self.blackView removeFromSuperview];
    }
}

@end
