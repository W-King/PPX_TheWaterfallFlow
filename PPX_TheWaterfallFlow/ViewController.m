//
//  ViewController.m
//  PPX_TheWaterfallFlow
//
//  Created by pipixia on 16/8/23.
//  Copyright © 2016年 pipixia. All rights reserved.
//

#import "ViewController.h"
#import "WaterfallFlowViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (void)btnClicked
{
    WaterfallFlowViewController *waterfallFlowVC = [[WaterfallFlowViewController alloc]init];
    [self.navigationController pushViewController:waterfallFlowVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
