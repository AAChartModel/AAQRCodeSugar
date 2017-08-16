//
//  ViewController.m
//  AAQRCodeSugarDemo
//
//  Created by An An on 2017/8/6.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "ViewController.h"
#import "AAImageMosaic.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.backgroundColor = [UIColor cyanColor];
    imageView.frame = CGRectMake(50, 100,200, 200);
    
//    UIImage *originalImage = [UIImage imageNamed:@"16357599.jpeg"];
    UIImage *originalImage = [UIImage imageNamed:@"IMG_2105.JPG"];
    UIImage *finalImage = [AAImageMosaic grayImage:originalImage];
    imageView.image = [AAImageMosaic convertToGrayscale:finalImage];
    
    [self.view addSubview:imageView];

 }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
