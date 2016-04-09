//
//  ToDoItemTableViewCell.m
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "ToDoItemTableViewCell.h"

@implementation ToDoItemTableViewCell

- (void)awakeFromNib {
    self.titleLabel.text = nil;
    self.dueDateLabel.text = nil;}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    self.titleLabel.text = nil;
    self.dueDateLabel.text = nil;
}

@end