//
//  DetailViewController.h
//  In Due Time
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@protocol SendDataBack <NSObject>

- (void)upadateToDoItem:(ToDoItem *)updatedToDoItem forCellAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) ToDoItem *toDoItem;
@property (strong, nonatomic) NSIndexPath *originCellIndexPath;

@property (weak, nonatomic) id <SendDataBack> delegate;

@end
