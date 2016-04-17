//
//  DetailViewController.m
//  In Due Time
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "DetailViewController.h"
#import "TitleTableViewCell.h"
#import "ToDoItem.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *cellIdentifiers;

- (TitleTableViewCell *)createTitleCellForTableView:(UITableView *)tableView;
- (IBAction)changeCheckboxValue:(id)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellIdentifiers = @[@"titleCell"];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.delegate upadateToDoItem:self.toDoItem forCellAtIndexPath:self.originCellIndexPath];
}

#pragma mark - UITableViewDataSourceDelegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self createTitleCellForTableView:tableView];
}

- (TitleTableViewCell *)createTitleCellForTableView:(UITableView *)tableView
{
    TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
    cell.titleLabel.text = self.toDoItem.title;
    
    if (self.toDoItem.isChecked) {
        UIImage *checkedCheckboxImage = [UIImage imageNamed:@"Checked Checkbox.png"];
        [cell.checkboxButton setImage:checkedCheckboxImage forState:normal];
        self.toDoItem.isChecked = YES;
        
    }else{
        UIImage *uncheckedCheckboxImage = [UIImage imageNamed:@"Unchecked Checkbox.png"];
        [cell.checkboxButton setImage:uncheckedCheckboxImage forState:normal];
        self.toDoItem.isChecked = NO;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIAlertController *editTitleAlertController = [UIAlertController alertControllerWithTitle:@"Edit your ToDo title" message:@"Enter a new title for your ToDo" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:@"Cancel"
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           NSLog(@"Cancel action");
                                       }];
        
        [editTitleAlertController addAction:cancelAction];
        
        UIAlertAction *updateAction = [UIAlertAction
                                    actionWithTitle:@"Update Title"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action)
                                    {
                                        self.toDoItem.title = editTitleAlertController.textFields.firstObject.text;
                                        [self.tableView reloadData];
                                    }];
        [editTitleAlertController addAction:updateAction];
        
        [editTitleAlertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
            textField.text = [NSString stringWithString:self.toDoItem.title];
            textField.placeholder = @"Title";
        }];
        
        [self presentViewController:editTitleAlertController animated:YES completion:nil];
    }
    
}

#pragma mark - UIStoryboard Methods

- (IBAction)changeCheckboxValue:(id)sender
{
    CGPoint checkboxPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:checkboxPosition];
    TitleTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (!self.toDoItem.isChecked) {
        UIImage *checkedCheckboxImage = [UIImage imageNamed:@"Checked Checkbox.png"];
        [cell.checkboxButton setImage:checkedCheckboxImage forState:normal];
        self.toDoItem.isChecked = YES;
        
    }else{
        UIImage *uncheckedCheckboxImage = [UIImage imageNamed:@"Unchecked Checkbox.png"];
        [cell.checkboxButton setImage:uncheckedCheckboxImage forState:normal];
        self.toDoItem.isChecked = NO;
    }
}


@end
