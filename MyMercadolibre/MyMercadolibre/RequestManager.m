//
//  RequestManager.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "RequestManager.h"
#import "AFNetworking.h"
#import "UserPreferencesManager.h"

@implementation RequestManager

static NSString *const kSearchURL = @"https://api.mercadolibre.com/sites/%@/search?q=%@&limit=50";
static NSString *const kSiteshURL = @"https://api.mercadolibre.com/sites";
static NSString *const kItemURL = @"https://api.mercadolibre.com/items/%@";


- (void)getSites:(void (^) (NSMutableArray *))callBackBlock {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSURL *url = [NSURL URLWithString:kSiteshURL];
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		NSURLResponse *response;
		NSError *error;
		NSMutableArray *sitesArray = [[NSMutableArray alloc] init];

		NSLog(@"getSites: Url: %@", kSiteshURL);

		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

		if (data.length > 0 && !error) {
		    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
		    JCCountry *auxCountry = nil;

		    // show all values
		    for (NSDictionary *country in res) {
		        auxCountry = [[JCCountry alloc] initWithDataResponse:country];
		        [sitesArray addObject:auxCountry];
			}


		    dispatch_async(dispatch_get_main_queue(), ^{
				callBackBlock(sitesArray);
			});
		}
	});
}

- (void)searchWith:(NSString *)text callBackBlock:(void (^)(NSMutableArray *))callBackBlock {
	UserPreferencesManager *preferences = [[UserPreferencesManager alloc] init];
	NSString *siteSelected = [preferences getSiteIdSelected];

	NSString *stringUrl = [NSString stringWithFormat:kSearchURL, siteSelected, text];

	NSLog(@"searchWith: Url: %@", stringUrl);
	NSURL *url = [NSURL URLWithString:stringUrl];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];


	AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	operation.responseSerializer = [AFJSONResponseSerializer serializer];

	[operation setCompletionBlockWithSuccess: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];

	    JCItemEntity *auxItem = nil;

	    // Get the result values

	    NSArray *results = responseObject[@"results"];

	    // Save them in an array
	    for (NSDictionary *itemData in results) {
	        auxItem = [[JCItemEntity alloc] initWithDataResponse:itemData];
	        [itemsArray addObject:auxItem];
		}

	    callBackBlock(itemsArray);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    callBackBlock(nil);
	}];

	[operation start];
}

- (void)getItemById:(NSString *)id callBackBlock:(void (^) (JCItemEntity *))callBackBlock {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSString *stringUrl = [NSString stringWithFormat:kItemURL, id];
		NSURL *url = [NSURL URLWithString:stringUrl];

		NSLog(@"getItemById: Url: %@", stringUrl);

		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		NSURLResponse *response;
		NSError *error;

		NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

		if (data.length > 0 && !error) {
		    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

		    JCItemEntity *aux = [[JCItemEntity alloc] initWithDataResponse:res];

		    dispatch_async(dispatch_get_main_queue(), ^{
				callBackBlock(aux);
			});
		}
	});
}

@end
