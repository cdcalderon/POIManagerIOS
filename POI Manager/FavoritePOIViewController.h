//
//  FavoritePOIViewController.h
//  POI Manager
//
//  Created by carlos calderon on 5/3/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritePOIViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)barButtonItemPressed:(UIBarButtonItem *)sender;

@end
