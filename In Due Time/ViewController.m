//
//  ViewController.m
//  In Due Time
//
//  Created by Belén Molina del Campo on 09/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItemTableViewCell.h"
#import "ToDoItem.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *toDoListArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoListArray = [[NSMutableArray alloc] initWithCapacity:0];
    ToDoItem *test = [ToDoItem new];
    test.title = @"Blabla";
    [self.toDoListArray addObject:test];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDoListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"toDoItemCell"];
    ToDoItem *currentItem = self.toDoListArray[indexPath.row];
    
    cell.titleLabel.text = currentItem.title;
    
    return cell;
}

@end
