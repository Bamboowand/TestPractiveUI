//
//  JXPageVIewViewController.h
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/28.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <JXCategoryView/JXCategoryView.h>

NS_ASSUME_NONNULL_BEGIN

@interface JXPageVIewViewController : UIViewController
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@end

NS_ASSUME_NONNULL_END
