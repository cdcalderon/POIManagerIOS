//
//  DirectionsLIstViewController.h
//  POI Manager
//
//  Created by carlos calderon on 4/26/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectionsLIstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *steps;
@end
