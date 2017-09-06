//
//  KCMineAvatarCell.m
//  kcalclub
//
//  Created by WangLei on 2017/8/31.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCMineAvatarCell.h"
#import "UIColor+Common.h"
#import "UIImage+Common.h"
#import "NSObject+Common.h"

@interface KCMineAvatarCell()

@property (nonatomic, weak) UIButton *avatarButton;
@property (nonatomic, weak) UILabel *nickLabel;
@property (nonatomic, weak) UILabel *signatureLabel;
@property (nonatomic, weak) UIImageView *arrowImageView;

@end

@implementation KCMineAvatarCell

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
        [self avatarButton];
        [self nickLabel];
        [self signatureLabel];
        [self arrowImageView];
    }
    return self;
}


- (UIButton *)avatarButton{
    if (!_avatarButton) {
        UIButton *btn = [UIButton new];
        [self.contentView addSubview:btn];
        self.avatarButton = btn;
        btn.backgroundColor = [UIColor whiteColor];
        [btn setImage:[UIImage imageNamed:@"ic_avatar_ default"] forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 50;
        
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:100.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:100.f]];
       
    }
    return _avatarButton;
}


- (UILabel *)nickLabel{
    if (!_nickLabel) {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        self.nickLabel = label;
        label.text = @"昵称";
        label.font = [UIFont systemFontOfSize:18.0f];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
//        label.backgroundColor = RGB_R;
        
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_avatarButton attribute:NSLayoutAttributeRight multiplier:1 constant:20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-50]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatarButton attribute:NSLayoutAttributeCenterY multiplier:1 constant:-20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:40.f]];
    }
    return _nickLabel;
}

- (UILabel *)signatureLabel{
    if (!_signatureLabel) {
        UILabel *label = [UILabel new];
        [self.contentView addSubview:label];
        self.signatureLabel = label;
        label.text = @"个性签名";
        label.font = [UIFont systemFontOfSize:15.0f];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentLeft;
//        label.backgroundColor = RGB_R;
        
        label.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_avatarButton attribute:NSLayoutAttributeRight multiplier:1 constant:20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-50]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatarButton attribute:NSLayoutAttributeCenterY multiplier:1 constant:20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:40.f]];
    }
    return _signatureLabel;
}


- (UIImageView *)arrowImageView{
    if (!_arrowImageView) {
        UIImage *image = [UIImage imageNamed:@"ic_cell_right_arrow_white"];
        UIImageView *imgv = [[UIImageView alloc]initWithImage:image];
        [self.contentView addSubview:imgv];
        self.arrowImageView = imgv;
        
        
        imgv.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:_avatarButton attribute:NSLayoutAttributeCenterY multiplier:1 constant:0.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:image.size.width]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:imgv attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:image.size.height]];
    }
    return _arrowImageView;
}

@end
