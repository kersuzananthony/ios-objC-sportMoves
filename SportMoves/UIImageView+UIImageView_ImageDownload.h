//
//  UIImageView+UIImageView_ImageDownload.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (UIImageView_ImageDownload)
- (NSURLSessionDownloadTask *) downloadImageWithURL:(NSURL *)url;
@end

