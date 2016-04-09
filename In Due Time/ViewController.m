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
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)addNewItem:(id)sender;

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

- (IBAction)addNewItem:(id)sender {
    
    UIAlertController *addNewItemAlertController = [UIAlertController alertControllerWithTitle:@"New ToDo" message:@"Add a title and a due date for your new ToDo" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    [addNewItemAlertController addAction:cancelAction];
    
    UIAlertAction *addAction = [UIAlertAction
                               actionWithTitle:@"Add"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   ToDoItem *newItem = [ToDoItem new];
                                   newItem.title = addNewItemAlertController.textFields.firstObject.text;
                                   [self.toDoListArray addObject:newItem];
                                   [self.tableView reloadData];
                               }];
    [addNewItemAlertController addAction:addAction];
    
    [addNewItemAlertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        
        textField.placeholder = @"Title";
        NSLog(@"Textfield configuration Handler");
    }];
    
    [self presentViewController:addNewItemAlertController animated:YES completion:nil];
    
}
@end
