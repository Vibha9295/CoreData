//
//  DetailViewController.m
//  CoreDataDemo
//
//  Created by vibha on 8/1/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import "DetailViewController.h"
@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize device;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.device) {
        [_nameTxtField setText:[device valueForKey:@"name"]];
        [_versionTxtField setText:[device valueForKey:@"version"]];
        [_ComapnyTxtField setText:[device valueForKey:@"company"]];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)btnSave:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (device) {
        // Update existing device
        [device setValue:_nameTxtField.text forKey:@"name"];
        [device setValue:_versionTxtField.text forKey:@"version"];
        [device setValue:_ComapnyTxtField.text forKey:@"company"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
        [newDevice setValue:_nameTxtField.text forKey:@"name"];
        [newDevice setValue:_versionTxtField.text forKey:@"version"];
        [newDevice setValue:_ComapnyTxtField.text forKey:@"company"];
    }
    
    NSError *error = nil;
    // Save the object to 	persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
