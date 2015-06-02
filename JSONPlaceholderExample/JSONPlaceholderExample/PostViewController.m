//
//  PostViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "PostViewController.h"
#import "Post.h"
#import "JCPostDetailViewController.h"

@interface PostViewController ()


@end

@implementation PostViewController


- (id)init {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Posts";
		self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Posts" image:[UIImage imageNamed:@"post"] tag:0];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *simpleTableIdentifier = @"SimpleTableItem";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
	}

	Post *post = [self.dataList objectAtIndex:indexPath.row];
	cell.textLabel.text = post.title;

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];

	Post *post = [self.dataList objectAtIndex:indexPath.row];


	JCPostDetailViewController *detailView = [[JCPostDetailViewController alloc] initWithPost:post];

	[self.navigationController pushViewController:detailView animated:YES];
}

- (void)makeRequestToServer {
	// Make a Request in background

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		// Get the mock items

		NSMutableArray *posts = [reqManager getPostBySelectedUser];

		dispatch_async(dispatch_get_main_queue(), ^{
			self.dataList = posts;

			[self.viewTable reloadData];

			[self hideProgressView];
		});
	});
}

@end
