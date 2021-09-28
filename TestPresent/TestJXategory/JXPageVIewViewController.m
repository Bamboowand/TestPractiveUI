//
//  JXPageVIewViewController.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/28.
//

#import "JXPageVIewViewController.h"

@interface JXPageVIewViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIView *topView;

@end

@implementation JXPageVIewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.contentScrollView];
    [self addBaseConstraints];
    [self.contentScrollView layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.categoryView.titles = self.titles;
    
}

- (void)addBaseConstraints {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(200);
    }];

    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(100);
        make.left.mas_offset(32);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(80);
    }];

    [self.contentScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.categoryView.mas_bottom).offset(8);
        make.left.mas_offset(16);
        make.right.mas_offset(-16);
        make.bottom.mas_offset(0);
    }];
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        [_topView setBackgroundColor:[UIColor redColor]];
    }
    return _topView;
}

- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,
                                                                              0,
                                                                              [UIScreen mainScreen].bounds.size.width, 50)];
        [_categoryView setBackgroundColor:[UIColor yellowColor]];
        [_categoryView setTitleSelectedColor:[UIColor blueColor]];
        [_categoryView setTitleSelectedFont:[UIFont boldSystemFontOfSize:16]];
        [_categoryView setTitleColor:[UIColor grayColor]];
        [_categoryView setTitleFont:[UIFont systemFontOfSize:16]];
        _categoryView.titles = self.titles;
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorColor = [UIColor blueColor];
        lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
        _categoryView.indicators = @[lineView];
        _categoryView.contentScrollView = self.contentScrollView;
    }
    return _categoryView;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"測試_1", @"測試_2"];
    }
    return _titles;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        [_contentScrollView setBackgroundColor:[UIColor grayColor]];
        [_contentScrollView setBounces:NO];
        [_contentScrollView setPagingEnabled:YES];
        [_contentScrollView setShowsVerticalScrollIndicator:NO];
        [_contentScrollView setShowsHorizontalScrollIndicator:NO];
    }
    return _contentScrollView;
}

#pragma mark - UIScrollViewDelete
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isKindOfClass:[UITableView class]] || [scrollView isKindOfClass:[UICollectionView class]]) {
        CGFloat y = scrollView.contentOffset.y;
        if (y <= 0) {
            return;
        }
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top).offset(200 - (y + 200));
        }];

        [self.categoryView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view.mas_top).offset(100 - y);
        }];
    }
}

@end
