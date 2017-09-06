//
//  KCPersonalAvatarCell.m
//  kcalclub
//
//  Created by WangLei on 2017/8/31.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCPersonalAvatarCell.h"
#import "UIColor+Common.h"
#import "UIImage+Common.h"
#import "NSObject+Common.h"

@interface KCPersonalAvatarCell()

@property (nonatomic, weak) UIButton *avatarButton;
@property (nonatomic, weak) UILabel *titleLabel;

@end

@implementation KCPersonalAvatarCell

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
        [self titleLabel];
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




- (UIButton *)avatarButton{
    if (!_avatarButton) {
        UIButton *btn = [UIButton new];
        [self.contentView addSubview:btn];
        self.avatarButton = btn;
        btn.backgroundColor = [UIColor grayColor];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 40;
        [btn setImage:[UIImage imageNamed:@"ic_avatar_ default"] forState:UIControlStateNormal];
        
        
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-30.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-20.f]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:btn attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
       
    }
    return _avatarButton;
}






#pragma mark -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

@end
