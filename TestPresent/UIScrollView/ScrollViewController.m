//
//  ScrollViewController.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/27.
//

#import "ScrollViewController.h"
#import <Masonry/Masonry.h>

@interface ScrollViewController () <UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate>
@property (strong, nonatomic) UIScrollView *mainView;
@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, assign) CGFloat yOfScroll;
@end

@implementation ScrollViewController
- (UIScrollView *)mainView {
    if (!_mainView) {
        _mainView = [[UIScrollView alloc] init];
        _mainView.frame = self.view.frame;
        _mainView.delegate = self;
        _mainView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width , 700);
        _mainView.contentOffset = CGPointMake(0.0, -20);
    }
    return _mainView;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] init];
        [_topView setBackgroundColor:[UIColor yellowColor]];
    }
    return _topView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        [_tableView setBackgroundColor:[UIColor redColor]];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView setBounces:NO];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainView];
    [self.mainView addSubview:self.topView];
    [self.mainView addSubview:self.tableView];

    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.mas_equalTo(self.tableView.mas_bottom);
//        make.top.mas_equalTo(self.view.mas_top);
//        make.left.mas_equalTo(self.view.mas_left);
//        make.right.mas_equalTo(self.view.mas_right);
//        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];

    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mainView.mas_top);
        make.left.mas_equalTo(self.mainView.mas_left);
        make.right.mas_equalTo(self.mainView.mas_right);
        make.height.mas_equalTo(50).priorityHigh();
        make.width.mas_equalTo(self.mainView.mas_width);
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topView.mas_bottom);
        make.left.mas_equalTo(self.mainView.mas_left);
        make.right.mas_equalTo(self.mainView.mas_right);
        make.bottom.mas_equalTo(self.mainView.mas_bottom);
//        make.width.mas_equalTo(self.mainView.mas_width);
        make.height.mas_equalTo(800);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"YAYYA_%ld", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isKindOfClass:[UITableView class]]) {
        CGFloat y = scrollView.contentOffset.y + 50;
        [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mainView.mas_top).offset(50 - y);
        }];
    }
}


@end
