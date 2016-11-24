//
//  MainViewController.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "MainViewController.h"
#import "HTTPService.h"
#import "MoveCell.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<Move *> *moves;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moves = [[NSMutableArray alloc]init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self registerTableViewCell];
    
    if (self.coreDataManager != nil) {
        // Load data from server
        [[HTTPService sharedInstance]loadDataFromServerWithCoreDataManager:self.coreDataManager andCompletionHandler:^(NSArray<Move *> * _Nullable moves, NSString * _Nullable errorMessage) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (errorMessage != nil) {
                    [self displayErrorMessage:errorMessage];
                }
                
                // Reload data only if the array of moves contains new data
                if (moves.count > 0) {
                    self.moves = nil;
                    self.moves = [[NSMutableArray alloc]initWithArray:moves];
                    
                    [self.tableView reloadData];
                }
            });
            
        }];
    }
}

// MARK: - Controller custom methods
- (void)registerTableViewCell {
    UINib *moveCellNib = [UINib nibWithNibName:@"MoveCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:moveCellNib forCellReuseIdentifier:@"MoveCell"];
}

- (void)displayErrorMessage:(NSString * _Nonnull)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

// MARK: - UITableViewDataSource methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.moves.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoveCell *moveCell = (MoveCell *) [self.tableView dequeueReusableCellWithIdentifier:@"MoveCell" forIndexPath:indexPath];
    
    Move *currentMove = [self.moves objectAtIndex:indexPath.row];
    
    [moveCell configureCellWithMove:currentMove];
    
    return moveCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

@end
