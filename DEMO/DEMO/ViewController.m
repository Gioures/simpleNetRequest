//
//  ViewController.m
//  DEMO
//
//  Created by ytkjs on 2019/1/10.
//  Copyright © 2019年 a. All rights reserved.
//

#import "ViewController.h"
#import "SimpleNetRequest.h"
#import "Json.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * url = @"https://www.baidu.com";
    [SimpleNetRequest getWithUrl:url para:nil
                          header:nil
                     finishBlock:^(NSData *data) {
                         NSLog(@"%@",data);
                     } failledBlock:^(NSError *error) {
                         NSLog(@"%@",error);
                     }];
    
    
}


@end
