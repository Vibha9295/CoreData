//
//  DetailViewController.h
//  CoreDataDemo
//
//  Created by vibha on 8/1/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *versionTxtField;
@property (strong, nonatomic) IBOutlet UITextField *ComapnyTxtField;
- (IBAction)btnSave:(id)sender;
@property (strong) NSManagedObject *device;
- (IBAction)btnCancel:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *nameTxtField;
@end
