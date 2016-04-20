//
//  ViewController.h
//  POI Manager
//
//  Created by carlos calderon on 4/12/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POIListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)refreshBarButtonItemPressed:(UIBarButtonItem *)sender;

@end

