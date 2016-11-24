//
//  UIImageView+UIImageView_ImageDownload.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "UIImageView+UIImageView_ImageDownload.h"

@implementation UIImageView (UIImageView_ImageDownload)

- (NSURLSessionDownloadTask *)downloadImageWithURL:(NSURL *)url {
    NSURLSession *session = [NSURLSession sharedSession];
    UIImageView __weak *weakSelf = self;
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error == nil) {
                NSData *data = [NSData dataWithContentsOfURL:location];
                
                if (data != nil) {
                    UIImage *image = [[UIImage alloc]initWithData:data];
                    
                    if (image != nil) {
                        weakSelf.image = image;
                    }
                }
            }
        });
        
    }];
    
    [downloadTask resume];
    
    return downloadTask;
}

- (void)displayErrorImage {
    self.image = [UIImage imageNamed:@"error_image"];
}

@end
