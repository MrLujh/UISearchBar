//
//  ViewController.m
//  UISearchBar
//
//  Created by lujh on 2017/5/2.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "ViewController.h"
#import "CustomSearchBar.h"

@interface ViewController ()<SearchTextFieldDidChangeDelegate>

@property(nonatomic,strong)CustomSearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _searchBar = [[CustomSearchBar alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 60) image:[UIImage imageNamed:@"Study_icon_sousuo"] placeholder:@"搜索作者、书名、内容等"];
    _searchBar.searchTextFieldDidChangeDelegate = self;
    [self.view addSubview:_searchBar];
    
}

- (void)searchTextFieldDidChangeWithNSString:(NSString *)str {

    NSLog(@"结束编辑 == %@ " ,str);

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];
    [_searchBar.seaechTextField resignFirstResponder];
}

@end
