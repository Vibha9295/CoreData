//
//  DeviceTableViewController.h
//  CoreDataDemo
//
//  Created by vibha on 8/1/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
@interface DeviceTableViewController : UITableViewController
@property (strong) NSMutableArray *devices;
@property (strong, nonatomic) IBOutlet UITableView *tblView;
- (IBAction)btnBack:(id)sender;

@end
