//
//  TestViewController.m
//  TestPresent
//
//  Created by Jacob Jheng on 2021/9/28.
//

#import "TestViewController.h"

@interface TestViewController () <UITableViewDataSource, UICollectionViewDataSource, UITableViewDelegate, UICollisionBehaviorDelegate>
@property (nonatomic, strong) UITableView *testTableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"OWWO", @"攝氏"];
    [self.contentScrollView addSubview:self.testTableView];
    [self.contentScrollView addSubview:self.collectionView];
    [self addConstraints];
}

- (void)addConstraints {
    [self.testTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.contentScrollView);
        make.right.mas_equalTo(self.collectionView.mas_left);
        make.width.mas_equalTo(self.contentScrollView.frame.size.width);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];

    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(self.contentScrollView);
        make.width.mas_equalTo(self.contentScrollView.frame.size.width);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];

    [self setupLayer];
}

- (void)setupLayer {
    [self.testTableView layoutIfNeeded];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.testTableView.bounds
                                               byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                     cornerRadii:CGSizeMake(8, 8)];
    

    
}

- (UITableView *)testTableView {
    if (!_testTableView) {
        _testTableView = [[UITableView alloc] init];
        [_testTableView setBackgroundColor:[UIColor cyanColor]];
        _testTableView.dataSource = self;
        _testTableView.delegate = self;
        [_testTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_testTableView setBounces:NO];
        [_testTableView setBackgroundColor:[UIColor grayColor]];
    }
    return _testTableView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 20;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        layout.itemSize = CGSizeMake((screenWidth - 60)/2, (screenWidth - 60)/2);
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView setBounces:NO];
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _collectionView.alwaysBounceVertical = YES;
    }
    return _collectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"YAYAY_%ld", indexPath.row];
    [cell setBackgroundColor:[UIColor greenColor]];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UILabel *textLabel = [UILabel new];
    textLabel.font = [UIFont systemFontOfSize:16.0f];
    textLabel.textColor = [UIColor blackColor];
    textLabel.text = [NSString stringWithFormat:@"第%zd", indexPath.item];
    [cell.contentView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(cell.contentView);
    }];
    
    return cell;
}



@end
