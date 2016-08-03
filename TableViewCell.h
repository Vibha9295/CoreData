//
//  TableViewCell.h
//  CoreDataDemo
//
//  Created by vibha on 8/1/16.
//  Copyright © 2016 com.zaptechsolutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDetail;

@end
