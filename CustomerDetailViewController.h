//
//  CustomerDetailViewController.h
//  CoreDataDemo
//
//  Created by vibha on 8/2/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface CustomerDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTxtField;
@property (strong, nonatomic) IBOutlet UITextField *numberTxtField;
- (IBAction)btnSave:(id)sender;
@property (strong) NSManagedObject *customer;
- (IBAction)btnCancel:(id)sender;

@end
