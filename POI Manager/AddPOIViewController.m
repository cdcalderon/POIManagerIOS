//
//  AddPOIViewController.m
//  POI Manager
//
//  Created by carlos calderon on 5/3/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "AddPOIViewController.h"
#import "AppDelegate.h"

@interface AddPOIViewController ()

@end

@implementation AddPOIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonPressed:(UIButton *)sender {
}

- (IBAction)barButtonItemPressed:(UIBarButtonItem *)sender {

    [[self drawControllerFromDelegate] toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - DrawController Methods

-(MMDrawerController *)drawControllerFromDelegate
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    return appDelegate.drawerController;
}
@end
