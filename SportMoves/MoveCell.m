//
//  MoveCell.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "MoveCell.h"
#import "Move+CoreDataClass.h"
#import "UIImageView+UIImageView_ImageDownload.h"


@interface MoveCell()
@property (weak, nonatomic) IBOutlet UILabel *moveNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moveImageView;

@property (nonatomic, strong) NSURLSessionDownloadTask * _Nullable downloadTask;
@property (nonatomic, strong) Move *move;

@end

@implementation MoveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.moveImageView.image = [UIImage imageNamed:@"empty"];
}

- (void)prepareForReuse {
    [self.downloadTask cancel];
    self.downloadTask = nil;
    
    self.moveNameLabel.text = nil;
    self.moveImageView.image = [UIImage imageNamed:@"empty"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

// MARK: MoveCell custom methods
- (void)configureCellWithMove:(Move *)aMove {
    self.move = aMove;
    
    self.moveNameLabel.text = aMove.moveName;
 
    NSURL *urlImage = [NSURL URLWithString:aMove.remoteURL];
    if (urlImage != nil) {
        self.downloadTask = [self.moveImageView downloadImageWithURL:urlImage];
    }
}

@end
