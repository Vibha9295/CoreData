//
//  CustomerTableViewController.h
//  CoreDataDemo
//
//  Created by vibha on 8/2/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerTableViewCell.h"
#import <CoreData/CoreData.h>
@interface CustomerTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tblView;
@property (strong) NSMutableArray *customers;
- (IBAction)btnBack:(id)sender;


@end
