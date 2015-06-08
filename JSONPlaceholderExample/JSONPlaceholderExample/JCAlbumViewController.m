//
//  JCAlbumViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCAlbumViewController.h"
#import "Album.h"
#import "AlbumTableViewCell.h"
#import "PhotoViewController.h"


@interface JCAlbumViewController ()

@end

@implementation JCAlbumViewController


- (id)init {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Albums";
		self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Albums" image:[UIImage imageNamed:@"photo"] tag:0];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *MyIdentifier = @"AlbumCellView";

	Album *item = [self.dataList objectAtIndex:indexPath.row];

	AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AlbumTableViewCell" owner:self options:nil];
		cell = [nib objectAtIndex:0];
	}

	cell.albumTitle.text = item.title;
	cell.albumImage.image = [UIImage imageNamed:@"album"];

	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];

	Album *album = [self.dataList objectAtIndex:indexPath.row];


	PhotoViewController *detailView = [[PhotoViewController alloc] initWithPost:album];

	[self.navigationController pushViewController:detailView animated:YES];
}

- (void)makeRequestToServer {
	// Make a Request in background

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		// Get the mock items

		NSMutableArray *posts = [reqManager getAlbumsBySelectedUser];

		dispatch_async(dispatch_get_main_queue(), ^{
			self.dataList = posts;

			[self.viewTable reloadData];

			[self hideProgressView];
		});
	});
}

@end
