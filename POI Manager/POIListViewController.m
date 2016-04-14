//
//  ViewController.m
//  POI Manager
//
//  Created by carlos calderon on 4/12/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "POIListViewController.h"
//Client id
//RODUBYAI1CMKTSLDI04NLRU53HXLKSWR43GYICGD3CUPP0FN
//Client secret
//VG5P3M0XMPZ1ZHMW3UTUJHM2R3QPSU4FATDKCKYLGC1IY5VS

static NSString * const kCLIENTID = @"RODUBYAI1CMKTSLDI04NLRU53HXLKSWR43GYICGD3CUPP0FN";

static NSString * const kCLIENTSECRET = @"VG5P3M0XMPZ1ZHMW3UTUJHM2R3QPSU4FATDKCKYLGC1IY5VS";

@interface POIListViewController ()

@end

@implementation POIListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshBarButtonItemPressed:(UIBarButtonItem *)sender {
}
@end
