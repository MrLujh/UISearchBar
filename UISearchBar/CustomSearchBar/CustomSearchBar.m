//
//  CustomSearchBar.m
//  UISearchBar
//
//  Created by lujh on 2017/5/2.
//  Copyright © 2017年 lujh. All rights reserved.
//

#define RGB(r,g,b)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define leftPading 12
#import "CustomSearchBar.h"

@implementation CustomSearchBar

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image placeholder:(NSString*)placeholder {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor cyanColor];
        
        self.image = image;
        
        self.placeholder = placeholder;
        
        //  初始化子控件
        [self setupSubviews];
        
        // 通知:监听文字的改变
        [self.seaechTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    
    return self;
}

#pragma mark -通知:监听文字的改变

- (void)textFieldDidChange:(UITextField *)theTextField {
    
    if ([self.seaechTextField.text isEqualToString:@""]) {
        
        [_placeholderBtn setHidden: NO];
        
    }else {
        
        [_placeholderBtn setHidden:YES];
        
    }
    
    if ([self.searchTextFieldDidChangeDelegate respondsToSelector:@selector(searchTextFieldDidChangeWithNSString:)]) {
        
        [self.searchTextFieldDidChangeDelegate searchTextFieldDidChangeWithNSString:theTextField.text];
    }
}

#pragma mark -初始化子控件

- (void)setupSubviews {

    // textfield的占位文字
    CGFloat H = self.frame.size.height *0.3;
    CGFloat Y = (self.frame.size.height - H)/2.0;
    CGSize placeholderSize = [self.placeholder sizeWithFont:[UIFont systemFontOfSize:20] constrainedToSize:CGSizeMake(MAXFLOAT, H)];
    CGSize imagesSize = self.image.size;
    CGFloat W = placeholderSize.width +imagesSize.width ;
    
    CGFloat X = (self.frame.size.width - W)/2.0;
    
    CGRect rect = (CGRect){{X,Y},CGSizeMake(W, H)};
    self.rect = rect;
    _placeholderBtn = [[UIButton alloc] init];
    _placeholderBtn.frame = rect;
    [_placeholderBtn setImage:self.image forState:UIControlStateNormal];
    [_placeholderBtn setTitle:self.placeholder forState:UIControlStateNormal];
    [_placeholderBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _placeholderBtn.enabled = NO;
    [_placeholderBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [_placeholderBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [self addSubview:_placeholderBtn];
    
    // textfield
    _seaechTextField = [[UITextField alloc]initWithFrame:CGRectMake(leftPading, leftPading, self.frame.size.width-leftPading*2, self.frame.size.height - leftPading*2)];
    _seaechTextField.backgroundColor = [UIColor clearColor];
    _seaechTextField.layer.masksToBounds = YES;
    _seaechTextField.layer.cornerRadius = 10;
    _seaechTextField.layer.borderWidth = 0.5;
    _seaechTextField.layer.borderColor = RGB(221, 221, 221).CGColor;
    _seaechTextField.font = [UIFont systemFontOfSize:20];
    _seaechTextField.clearButtonMode = UITextFieldViewModeAlways;
    _seaechTextField.delegate = self;
    [self addSubview:_seaechTextField];

}

#pragma mark -UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [UIView animateWithDuration:0.1 animations:^{

        _placeholderBtn.frame = CGRectMake(leftPading, self.rect.origin.y, self.rect.size.width, self.rect.size.height);
    }];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {

    if ([textField.text isEqualToString:@""]) {
        
        [UIView animateWithDuration:0.1 animations:^{
            
            _placeholderBtn.frame = self.rect;
        }];
    }
}

@end
