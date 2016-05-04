//
//  AddPOIViewController.h
//  POI Manager
//
//  Created by carlos calderon on 5/3/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPOIViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *poiNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeOfFoodTextField;
- (IBAction)saveButtonPressed:(UIButton *)sender;
- (IBAction)barButtonItemPressed:(UIBarButtonItem *)sender;

@end
