//
//  RequestManager.m
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "RequestManager.h"
#import "User.h"
#import "UserPreferencesManager.h"
#import "Post.h"
#import "Album.h"
#import "Photo.h"

@implementation RequestManager

- (NSMutableArray *)getAllUsers {
	NSMutableArray *allUsers = [[NSMutableArray alloc] init];

	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jsonplaceholder.typicode.com/users"]];
	NSURLResponse *response = nil;
	NSError *error = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
	                                     returningResponse:&response
	                                                 error:&error];
	if (error == nil) {
		// Parse data here

		NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
		User *auxUser = nil;

		// show all values
		for (NSDictionary *user in res) {
			auxUser = [[User alloc] initWithDataResponse:user];
			[allUsers addObject:auxUser];
		}
	}
	else {
		allUsers = nil;
	}


	return allUsers;
}

- (NSMutableArray *)getPostBySelectedUser {
	NSMutableArray *allPostByUser = [[NSMutableArray alloc] init];

	UserPreferencesManager *manager = [[UserPreferencesManager alloc] init];
	NSInteger selectedUserId = [manager getUserIdSelected];

	NSString *url = [NSString stringWithFormat:@"http://jsonplaceholder.typicode.com/users/%ld/posts", (long)selectedUserId];


	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];

	NSURLResponse *response = nil;
	NSError *error = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
	                                     returningResponse:&response
	                                                 error:&error];
	if (error == nil) {
		// Parse data here

		NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
		Post *auxPost = nil;

		// show all values
		for (NSDictionary *post in res) {
			auxPost = [[Post alloc] initWithDataResponse:post];
			[allPostByUser addObject:auxPost];
		}
	}
	else {
		allPostByUser = nil;
	}

	return allPostByUser;
}

- (NSMutableArray *)getAlbumsBySelectedUser {
	NSMutableArray *allAlbumsByUser = nil;

	UserPreferencesManager *manager = [[UserPreferencesManager alloc] init];
	NSInteger selectedUserId = [manager getUserIdSelected];

	NSString *url = [NSString stringWithFormat:@"http://jsonplaceholder.typicode.com/users/%ld/albums", (long)selectedUserId];


	NSDictionary *res =  [self makeRequest:url];

	if (res != nil) {
		// Parse data here

		allAlbumsByUser = [[NSMutableArray alloc] init];

		Album *auxAlbum = nil;

		// show all values
		for (NSDictionary *album in res) {
			auxAlbum = [[Album alloc] initWithDataResponse:album];
			[allAlbumsByUser addObject:auxAlbum];
		}
	}

	return allAlbumsByUser;
}

- (NSMutableArray *)getPhotosByAlbum:(NSInteger)albumId {
	NSMutableArray *arrayData = nil;
	NSString *url = [NSString stringWithFormat:@"http://jsonplaceholder.typicode.com/albums/%ld/photos", (long)albumId];


	NSDictionary *res =  [self makeRequest:url];

	if (res != nil) {
		// Parse data here

		arrayData = [[NSMutableArray alloc] init];

		Photo *auxPhoto = nil;

		// show all values
		for (NSDictionary *photo in res) {
			auxPhoto = [[Photo alloc] initWithDataResponse:photo];
			[arrayData addObject:auxPhoto];
		}
	}

	return arrayData;
}

- (NSDictionary *)makeRequest:(NSString *)url {
	NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];

	NSURLResponse *response = nil;
	NSError *error = nil;
	NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
	                                     returningResponse:&response
	                                                 error:&error];

	NSDictionary *res = nil;

	if (error == nil) {
		// Parse data here

		res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
	}
	return res;
}

@end
