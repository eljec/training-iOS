//
//  PhotoViewController.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 6/2/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "PhotoViewController.h"
#import "RequestManager.h"
#import "PhotoCollectionViewCell.h"
#import "Photo.h"
#import "Album.h"
#import "MBProgressHUD.h"
#import "PhotoDetailViewController.h"


#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoViewController () {
	NSMutableArray *data;
	RequestManager *manager;
	Album *albumSelected;
	MBProgressHUD *progressView;
}

@end

@implementation PhotoViewController


- (id)initWithPost:(Album *)album {
	self = [super initWithNibName:NSStringFromClass([self class])
	                       bundle:[NSBundle mainBundle]];
	if (self) {
		self.title = @"Photos";
		albumSelected = album;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.photoCollectionView.delegate = self;
	self.photoCollectionView.dataSource = self;


	[self.photoCollectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PhotoCell"];

	manager = [[RequestManager alloc] init];

	progressView = [[MBProgressHUD alloc] initWithView:self.view];

	[self.view addSubview:progressView];
	progressView.delegate = self;



	self.photoCollectionView.hidden = YES;

	progressView.mode = MBProgressHUDModeIndeterminate;
	[progressView show:YES];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
		NSMutableArray *photos = [manager getPhotosByAlbum:albumSelected.id];

		dispatch_async(dispatch_get_main_queue(), ^{
			data = photos;

			[self.photoCollectionView reloadData];

			[progressView hide:YES afterDelay:1];
			self.photoCollectionView.hidden = NO;
		});
	});
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *MyIdentifier = @"PhotoCell";

	Photo *item = [data objectAtIndex:indexPath.row];

	PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[self.photoCollectionView dequeueReusableCellWithReuseIdentifier:MyIdentifier forIndexPath:indexPath];

//	UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.thumbnailUrl]]];
//
//	cell.photoTitle.text = item.title;
//	cell.photoImageView.image = image;

	//

	cell.photoTitle.text = item.title;

	NSURL *url = [NSURL URLWithString:item.thumbnailUrl];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];

	__weak PhotoCollectionViewCell *weakCell = cell;

	[cell.photoImageView setImageWithURLRequest:request
	                           placeholderImage:placeholderImage
	                                    success: ^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
	    weakCell.photoImageView.image = image;
	    [weakCell setNeedsLayout];
	} failure:nil];

	return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	Photo *photoSelected = [data objectAtIndex:indexPath.row];

	PhotoDetailViewController *detailController = [[PhotoDetailViewController alloc] initWithPhoto:photoSelected];

	[self.navigationController pushViewController:detailController animated:YES];
}

@end
