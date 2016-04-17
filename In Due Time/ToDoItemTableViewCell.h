//
//  ToDoItemTableViewCell.h
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface ToDoItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dueByLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkboxButton;

@property (strong ,nonatomic) ToDoItem *toDoItem;

@end
