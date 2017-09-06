//
//  KCPersonalLabelCell.m
//  kcalclub
//
//  Created by WangLei on 2017/8/31.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCPersonalLabelCell.h"
#import "UIColor+Common.h"
#import "UIImage+Common.h"
#import "NSObject+Common.h"

@interface KCPersonalLabelCell()

@property (nonatomic, weak) UILabel *infoLabel;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UIImageView *arrowImageView;

@end

@implementation KCPersonalLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



#pragma mark - 初始化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置
        self.clipsToBounds = YES;
        self.exclusiveTouch = YES;
        self.autoresizingMask = UIViewAutoresizingNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self infoLabel];
        [self titleLabel];
        [self arrowImageView];
    }
    return self;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        self.titleLabel = label;
        label.text = @"头像";
        label.font = [UIFont systemFontOfSize:18.0f];
        label.textColor = RGBHexColor(0x666666, 1);
        label.textAlignment = NSTextAlignmentLeft;
//        label.backgroundColor = RGB_R;
        
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:15.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-250.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:0.f]];
    }
    return _titleLabel;
}




- (UILabel *)infoLabel{
    if (!_infoLabel) {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        self.infoLabel = label;
        label.text = @"未输入内容";
        label.font = [UIFont systemFontOfSize:18.0f];
        label.textColor = RGBHexColor(0x333333, 1);
        label.textAlignment = NSTextAlignmentRight;
//        label.backgroundColor = RGB_R;
        
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-40.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:0.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-0.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:200]];
        
    }
    return _infoLabel;
}

- (UIImageView *)arrowImageView{
    if (!_arrowImageView) {
        UIImage *image = [UIImage imageNamed:@"ic_cell_right_arrow_gray"];
        UIImageView *imgv = [[UIImageView alloc]initWithImage:image];
        [self.contentView addSubview:imgv];
        self.arrowImageView = imgv;
        
        
        imgv.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:image.size.width]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:image.size.height]];
    }
    return _arrowImageView;
}



#pragma mark -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

@end
