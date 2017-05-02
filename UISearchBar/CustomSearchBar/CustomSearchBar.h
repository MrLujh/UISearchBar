//
//  CustomSearchBar.h
//  UISearchBar
//
//  Created by lujh on 2017/5/2.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTextFieldDidChangeDelegate <NSObject>

- (void)searchTextFieldDidChangeWithNSString:(NSString*)str;

@end


@interface CustomSearchBar : UIView <UITextFieldDelegate>
// textfield
@property(nonatomic, strong) UITextField *seaechTextField;
// textfield的占位图片
@property(nonatomic, copy) UIImage *image;
// textfield的占位文字
@property(nonatomic, copy) NSString *placeholder;
// textfield的占位按钮
@property(nonatomic,strong)UIButton *placeholderBtn;
// textfield的占位按钮cgrect
@property(nonatomic,assign)CGRect rect;
// SearchTextFieldDidEndEditingDelegate
@property(nonatomic,assign)id<SearchTextFieldDidChangeDelegate> searchTextFieldDidChangeDelegate;


- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image placeholder:(NSString*)placeholder;

@end
