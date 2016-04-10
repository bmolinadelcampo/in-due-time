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
#import "DatePickerTableViewCell.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *toDoListArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *datePickerIndexPath;
@property BOOL hasInlinePicker;

- (IBAction)addNewItem:(id)sender;
- (IBAction)setDueDate:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoListArray = [[NSMutableArray alloc] initWithCapacity:0];
    self.hasInlinePicker = NO;
    self.datePickerIndexPath = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.hasInlinePicker) {
        return [self.toDoListArray count] + 1;
    }else{
        return [self.toDoListArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"toDoItemCell";
    
    if (self.hasInlinePicker) {
        if ((indexPath.row == self.datePickerIndexPath.row + 1)) {
            cellIdentifier = @"datePickerCell";
            DatePickerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
           
            cell.datePicker.minimumDate = [NSDate date];
            
            return cell;
        }else if (indexPath.row > self.datePickerIndexPath.row + 1){
            ToDoItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            ToDoItem *currentItem = self.toDoListArray[indexPath.row - 1];
            
            cell.titleLabel.text = currentItem.title;
            if (currentItem.dueDate) {
                cell.dueDateLabel.text = currentItem.dueDate;
                cell.dueByLabel.text = @"Due by: ";
            }
            
            return cell;
        }else{
            ToDoItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            ToDoItem *currentItem = self.toDoListArray[indexPath.row];
            
            cell.titleLabel.text = currentItem.title;
            if (currentItem.dueDate) {
                cell.dueDateLabel.text = currentItem.dueDate;
                cell.dueByLabel.text = @"Due by: ";
            }
            
            return cell;
        }
    }else{
        ToDoItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        ToDoItem *currentItem = self.toDoListArray[indexPath.row];
        
        cell.titleLabel.text = currentItem.title;
        if (currentItem.dueDate) {
            cell.dueDateLabel.text = currentItem.dueDate;
            cell.dueByLabel.text = @"Due by: ";
        }
        
        return cell;
    }
}

- (IBAction)addNewItem:(id)sender {

    UIAlertController *addNewItemAlertController = [UIAlertController alertControllerWithTitle:@"New ToDo" message:@"Add a title for your new ToDo. Then you can tap on it to set a due date." preferredStyle:UIAlertControllerStyleAlert];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.hasInlinePicker) {
        if (indexPath.row == self.datePickerIndexPath.row + 1) {
            return 162;
        }
    }
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.reuseIdentifier isEqualToString:@"toDoItemCell"]) {
        [self displayInlineDatePickerForRowAtIndexPath: indexPath];
    }else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)displayInlineDatePickerForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView beginUpdates];
    
    if (!self.hasInlinePicker) {
        NSArray *indexPaths = @[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        self.hasInlinePicker = YES;
        self.datePickerIndexPath = indexPath;
    }else if (self.hasInlinePicker && self.datePickerIndexPath.row == indexPath.row) {
        NSArray *indexPaths = @[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        self.hasInlinePicker = NO;
        self.datePickerIndexPath = nil;
    }else{
        NSArray *indexPaths = @[[NSIndexPath indexPathForRow:self.datePickerIndexPath.row + 1 inSection:0]];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
        if (self.datePickerIndexPath.row < indexPath.row) {
            indexPaths = @[[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        }else{
            indexPaths = @[[NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0]];
        }
        
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        self.hasInlinePicker = YES;
        if (self.datePickerIndexPath.row < indexPath.row) {
            self.datePickerIndexPath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:0];
        }else{
            self.datePickerIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        }
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.tableView endUpdates];
}

- (IBAction)setDueDate:(UIDatePicker *)sender
{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
    [dateFormatter setDateFormat:@"MMM dd, yyyy HH:mm"];
    
    ToDoItem *currentToDoItem = self.toDoListArray[self.datePickerIndexPath.row];
    
    currentToDoItem.dueDate = [dateFormatter stringFromDate:sender.date];
    
    [self.tableView reloadData];
}
@end
