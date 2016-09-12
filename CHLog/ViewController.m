//
//  ViewController.m
//  CHLog
//
//  Created by lichanghong on 16/9/9.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<100; i++) {
        hhlog(@"test %@  %d",@"chlog",i);
    }
    // Do any additional setup after loading the view, typically from a nib.
}
 

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
