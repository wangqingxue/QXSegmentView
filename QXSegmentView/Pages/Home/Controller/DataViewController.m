//
//  DataViewController.m
//  QXSegmentView
//
//  Created by 王庆学 on 2017/11/6.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)initUI{
    [self.view addSubview:self.imageView];
    self.imageView.image = [UIImage imageNamed:self.iamgeString];
}

- (UIImageView *)imageView{
    if (!_imageView){
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.sizeW, self.view.sizeH)];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
