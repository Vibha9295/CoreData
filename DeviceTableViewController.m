//
//  DeviceTableViewController.m
//  CoreDataDemo
//
//  Created by vibha on 8/1/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import "DeviceTableViewController.h"
#import <CoreData/CoreData.h>
#import "DetailViewController.h"
@interface DeviceTableViewController ()

@end

@implementation DeviceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    _devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [_tblView reloadData];
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Update"]) {
        NSManagedObject *selectedDevice = [_devices objectAtIndex:[[_tblView indexPathForSelectedRow] row]];
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.device = selectedDevice;
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
 
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        // Configure the cell...
    NSManagedObject *device = [_devices objectAtIndex:indexPath.row];
    cell.lblTitle.text=[NSString stringWithFormat:@"%@ %@",[device valueForKey:@"name"],[device valueForKey:@"version"]];
    cell.lblDetail.text=[NSString  stringWithFormat:@"%@",[device valueForKey:@"company"]];
         return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete object from database
        [context deleteObject:[_devices objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }
        
        // Remove device from table view
        [_devices removeObjectAtIndex:indexPath.row];
        [_tblView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)btnBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];

    
}
@end
