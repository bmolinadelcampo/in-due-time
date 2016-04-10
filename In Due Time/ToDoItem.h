//
//  ToDoItem.h
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *dueDate;

@end
