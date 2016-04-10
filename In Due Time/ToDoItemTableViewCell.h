//
//  ToDoItemTableViewCell.h
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueByLabel;

@end
