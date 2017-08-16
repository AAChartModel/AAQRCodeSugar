//
//  AAImageMosaic.m
//  AAQRCodeSugarDemo
//
//  Created by An An on 2017/8/14.
//  Copyright © 2017年 An An. All rights reserved.
//

#import "AAImageMosaic.h"

@implementation AAImageMosaic

//二值化
+ (UIImage *)convertToGrayscale:(UIImage*)img {
    
    CGSize size = [img size];
    
    int width = size.width;
    
    int height = size.height;
    
    // the pixels will be painted to this array
    
    uint32_t *pixels = (uint32_t *) malloc(width * height * sizeof(uint32_t));
    
    // clear the pixels so any transparency is preserved
    
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // create a context with RGBA pixels
    
    CGContextRef context = CGBitmapContextCreate(pixels,
                                                 width,
                                                 height,
                                                 8,
                                                 width * sizeof(uint32_t),
                                                 colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    
    // paint the bitmap to our context which will fill in the pixels array
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [img CGImage]);
    
    int tt = 1;
    
    CGFloat intensity;
    
    int bw;
    
    for(int y = 0; y < height; y++) {
        
        for(int x = 0; x < width; x++) {
            
            uint8_t *rgbaPixel = (uint8_t *) &pixels[y * width + x];
            
            intensity = (rgbaPixel[tt] + rgbaPixel[tt + 1] + rgbaPixel[tt + 2]) / 3. / 255.;
            
            if (intensity > 0.45) {
                
                bw = 255;
                
            } else {
                
                bw = 0;
                
            }
            
            rgbaPixel[tt] = bw;
            
            rgbaPixel[tt + 1] = bw;
            
            rgbaPixel[tt + 2] = bw;
            
        }
        
    }
    
    // create a new CGImageRef from our context with the modified pixels
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    
    // we're done with the context, color space, and pixels
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(colorSpace);
    
    free(pixels);
    
    // make a new UIImage to return
    
    UIImage *resultUIImage = [UIImage imageWithCGImage:image];
    
    // we're done with image now too
    
    CGImageRelease(image);
    
    return resultUIImage;
}

//灰度
+ (UIImage *)grayImage:(UIImage *)source {
    int width = source.size.width;
    int height = source.size.height;
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  kCGImageAlphaNone);
    
    CGColorSpaceRelease(colorSpace);
    
    if (context == NULL) {
        return nil;
    }
    
    CGContextDrawImage(context,CGRectMake(0, 0, width, height), source.CGImage);
    
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    
    return grayImage;
}

@end
