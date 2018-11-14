//
//  ViewController.m
//  IMXTagLayout
//
//  Created by zhoupanpan on 2018/4/4.
//  Copyright © 2018年 panzhow. All rights reserved.
//

#import "ViewController.h"
#import "IMXCollectionViewTagsFlowLayout.h"

@interface ViewController ()<IMXCollectionViewTagsDelegateLayout,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *listView;
@property (nonatomic,strong)IMXCollectionViewTagsFlowLayout *tagLayout;

@property (nonatomic,strong)NSMutableArray *tags;

@end

@implementation ViewController

- (void)dealloc{
}
#pragma mark - Public

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.listView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.listView];
    self.listView.frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    
    self.tags = [[NSMutableArray alloc] init];
    for(int i = 0;i<20;i++){
        NSString *tag = [NSString stringWithFormat:@"tag:%d",i*100];
        [self.tags addObject:tag];
    }
    [self.listView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(IMXCollectionViewTagsFlowLayout *)layout sizeForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *tag = [self.tags objectAtIndex:indexPath.item];
    CGSize size = [tag boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 44) options:0 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} context:nil].size;
    return CGSizeMake(size.width+10, 44);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tags.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *tag = [self.tags objectAtIndex:indexPath.item];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lb = [cell viewWithTag:10];
    if(!lb){
        lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 44, 0)];
        lb.font = [UIFont systemFontOfSize:10];
        lb.textColor = [UIColor blackColor];
        lb.frame = cell.contentView.bounds;
        lb.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:lb];
    }
    lb.text = tag;
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - Event

#pragma mark - Private

#pragma mark - Getter & Setter
- (UICollectionView *)listView{
    if(!_listView){
        _listView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:self.tagLayout];
        _listView.delegate = self;
        _listView.dataSource = self;
        _listView.alwaysBounceVertical = YES;
        _listView.backgroundColor = [UIColor whiteColor];
        _listView.showsVerticalScrollIndicator = YES;
        _listView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _listView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _listView;
}
- (IMXCollectionViewTagsFlowLayout *)tagLayout{
    if(!_tagLayout){
        _tagLayout = [[IMXCollectionViewTagsFlowLayout alloc] init];
        _tagLayout.columnPadding = 8;
        _tagLayout.rowPadding = 4;
        _tagLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _tagLayout.delegate = self;
    }
    return _tagLayout;
}

@end
