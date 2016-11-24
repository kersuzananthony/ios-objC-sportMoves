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
    UIImageView __weak *weakSelf = self; // Prevent Retain cycle
    
    // Download image task
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        // Main Thread for updating UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error == nil) {
                NSData *data = [NSData dataWithContentsOfURL:location];
                
                if (data != nil) {
                    UIImage *image = [[UIImage alloc]initWithData:data];
                    
                    if (image != nil) {
                        weakSelf.image = image;
                    } else {
                        [self displayErrorImage];
                    }
                } else {
                    [self displayErrorImage];
                }
            } else {
                [self displayErrorImage];
            }
        });
        
    }];
    
    [downloadTask resume];
    
    return downloadTask;
}

// Display an error image if the user cannot download the move image
- (void)displayErrorImage {
    self.image = [UIImage imageNamed:@"cannot_download_image"];
}

@end
