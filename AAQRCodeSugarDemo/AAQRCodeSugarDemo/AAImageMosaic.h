//
//  AAImageMosaic.h
//  AAQRCodeSugarDemo
//
//  Created by An An on 2017/8/14.
//  Copyright © 2017年 An An. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AAImageMosaic : NSObject
//二值化
+ (UIImage *)convertToGrayscale:(UIImage*)img;
//灰度
+ (UIImage *)grayImage:(UIImage *)source;
@end
