//
//  ViewController.m
//  QXSegmentView
//
//  Created by 王庆学 on 2017/11/6.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "ViewController.h"
#import "QXSegmentView.h"
#import "DataViewController.h"

@interface ViewController ()

@property (nonatomic, strong) QXSegmentView *segmentView;
@property (nonatomic, strong) NSMutableArray *arrayController;
@property (nonatomic, strong) NSArray *arrayImageName;
@property (nonatomic, assign) NSInteger currentSelect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initRAC];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initUI{
    self.navigationItem.titleView = self.segmentView;
    _arrayImageName = @[@"image0",@"image1",@"image2"];
    for (int i = 0; i < 3; i++){
        DataViewController *viewController = [[DataViewController alloc]init];
        viewController.iamgeString = _arrayImageName[i];
//        [self addChildViewController:viewController];
        [self.arrayController addObject:viewController];
    }
}

- (NSMutableArray *)arrayController{
    if (!_arrayController){
        _arrayController = [NSMutableArray array];
    }
    return _arrayController;
}

- (void)initRAC{
    [self.segmentView.signalClick subscribeNext:^(id x) {
        NSInteger index = [(NSNumber *)x integerValue];
        UIViewController *controller = self.arrayController[index];
        [self.view addSubview:controller.view];
        if (_currentSelect == index){
            return ;
        }
        UIViewController *currentController = self.arrayController[_currentSelect];
        [currentController.view removeFromSuperview];
        _currentSelect = index;
    }];
}

- (QXSegmentView *)segmentView{
    if (!_segmentView){
        _segmentView = [QXSegmentView loadFromXib];
    }
    return _segmentView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
