//
//  QXSegmentView.m
//  QXSegmentView
//
//  Created by 王庆学 on 2017/11/6.
//  Copyright © 2017年 王庆学. All rights reserved.
//

#import "QXSegmentView.h"

@interface QXSegmentView()

@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UIImageView *baseImageView;
@property (strong, nonatomic) NSArray *arrayLabel;
@property (strong, nonatomic) NSArray *arrayImageName;
@property (strong, nonatomic) NSArray *arrayLabelTitle;
@property (strong, nonatomic) RACSubject *subject;
@property (assign, nonatomic) NSInteger currentSelect;

@end

@implementation QXSegmentView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initLabelArray];
    [self initTapGesture];
    [self setSelectWithIndex:0];
}

- (void)initTapGesture{
    NSInteger arrayCount = [_arrayLabel count];
    NSInteger tagBase = 100;
    for (int i = 0; i < arrayCount; i++){
        UILabel *label = _arrayLabel[i];
        label.text = self.arrayLabelTitle[i];
        label.userInteractionEnabled = YES;
        label.tag = tagBase + i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickLabel:)];
        [label addGestureRecognizer:tap];
    }
}

- (void)clickLabel:(UITapGestureRecognizer *)tap{
    UILabel *label = (UILabel *)tap.view;
    NSInteger select = label.tag - 100;
    [self setSelectWithIndex:select];
}

- (void)setSelectWithIndex:(NSInteger)select{
    if (self.currentSelect && self.currentSelect == select){
        return;
    }
    UIImage *imageClick = [UIImage imageNamed:self.arrayImageName[select]];
    [self.baseImageView setImage:imageClick];
    UILabel *labelSelect = self.arrayLabel[select];
    [labelSelect setTextColor:[UIColor grayColor]];
    UILabel *labelCurrent = self.arrayLabel[_currentSelect];
    [labelCurrent setTextColor:[UIColor blackColor]];
    _currentSelect = select;
    [self.subject sendNext:@(select)];
}

- (void)initLabelArray{
    _arrayLabel = @[_labelOne,_labelTwo,_labelThree];
    _arrayImageName = @[@"segmentInformation",@"segmentAllday",@"segmentCalendar"];
    _arrayLabelTitle = @[@"第一栏",@"第二栏",@"第三栏"];
}

- (RACSignal *)subject{
    if (!_subject){
        _subject = [RACReplaySubject subject];
    }
    return _subject;
}

- (RACSignal *)signalClick{
    if (!_subject){
        _subject = [RACReplaySubject subject];
    }
    return _subject;
}

+ (QXSegmentView *)loadFromXib{
    QXSegmentView *NibView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil]firstObject];
    return NibView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
