//
//  ToDoItemTableViewCell.m
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "ToDoItemTableViewCell.h"

@implementation ToDoItemTableViewCell

- (void)setToDoItem:(ToDoItem *)toDoItem
{
    _toDoItem = toDoItem;
    
    self.titleLabel.text = toDoItem.title;
    if (toDoItem.dueDate) {
        self.dueDateLabel.text = toDoItem.dueDate;
        self.dueByLabel.text = @"Due by: ";
    }
}

- (void)awakeFromNib {
    self.titleLabel.text = nil;
    self.dueDateLabel.text = nil;
    self.dueByLabel.text = nil;
    UIImage *initialCheckboxImage = [UIImage imageNamed:@"Unchecked Checkbox.png"];
    [self.checkBoxButton setImage:initialCheckboxImage forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    self.titleLabel.text = nil;
    self.dueDateLabel.text = nil;
    self.dueByLabel.text = nil;
    UIImage *initialCheckboxImage = [UIImage imageNamed:@"Unchecked Checkbox.png"];
    [self.checkBoxButton setImage:initialCheckboxImage forState:UIControlStateNormal];
}

@end