//
//  CustomerDetailViewController.m
//  CoreDataDemo
//
//  Created by vibha on 8/2/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import "CustomerDetailViewController.h"

@interface CustomerDetailViewController ()

@end

@implementation CustomerDetailViewController
@synthesize customer;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.customer) {
        [_nameTxtField setText:[customer valueForKey:@"name"]];
        [_numberTxtField setText:[customer valueForKey:@"number"]];
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
    
    if (customer) {
        // Update existing device
        [customer setValue:_nameTxtField.text forKey:@"name"];
        [customer setValue:_numberTxtField.text forKey:@"number"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Customer" inManagedObjectContext:context];
        [newDevice setValue:_nameTxtField.text forKey:@"name"];
        [newDevice setValue:_numberTxtField.text forKey:@"number"];
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
