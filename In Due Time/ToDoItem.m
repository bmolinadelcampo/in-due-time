//
//  ToDoItem.m
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.dueDate forKey:@"dueDate"];
    [aCoder encodeBool:self.isChecked forKey:@"isChecked"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [self init];
    if (self) {
        self.title = [coder decodeObjectForKey:@"title"];
        self.dueDate = [coder decodeObjectForKey:@"dueDate"];
        self.isChecked = [coder decodeObjectForKey:@"isChecked"];
    }
    return self;
}

@end
