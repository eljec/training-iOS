//
//  ToDoListTableTableViewController.m
//  DemoApp
//
//  Created by Julio Castillo on 5/11/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "ToDoListTableTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableTableViewController ()

@end

@implementation ToDoListTableTableViewController

- (void)loadInitialData {
	ToDoItem *item1 = [[ToDoItem alloc] init];
	item1.itemName = @"Buy milk";
	[self.toDoItems addObject:item1];
	ToDoItem *item2 = [[ToDoItem alloc] init];
	item2.itemName = @"Buy eggs";
	[self.toDoItems addObject:item2];
	ToDoItem *item3 = [[ToDoItem alloc] init];
	item3.itemName = @"Read a book";
	[self.toDoItems addObject:item3];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
	AddToDoItemViewController *source = [segue sourceViewController];

	ToDoItem *item = source.toDoItem;

	// If the user press Cancel, the value will be nil

	if (item != nil) {
		[self.toDoItems addObject:item];

		[self.tableView reloadData];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.toDoItems = [[NSMutableArray alloc] init];

	[self loadInitialData];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];

	ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
	cell.textLabel.text = toDoItem.itemName;


	if (toDoItem.completed) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

	return cell;
}

/*
   // Override to support conditional editing of the table view.
   - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
   }
 */

/*
   // Override to support editing the table view.
   - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   }
 */

/*
   // Override to support rearranging the table view.
   - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
   }
 */

/*
   // Override to support conditional rearranging of the table view.
   - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
   }
 */

/*
   #pragma mark - Table view delegate

   // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
   - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];

    // Pass the selected object to the new view controller.

    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
   }
 */

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];

	ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];

	tappedItem.completed = !tappedItem.completed;

	// Tell the table view to reload the row whose data you just updated.

	[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
