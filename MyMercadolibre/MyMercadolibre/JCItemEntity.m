//
//  JCItemEntity.m
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import "JCItemEntity.h"

@implementation JCItemEntity


- (id)initWithDataResponse:(NSDictionary *)dataResponse {
	if (self = [super init]) {
		NSString *idString = [dataResponse objectForKey:@"id"];
		NSString *title = [dataResponse objectForKey:@"title"];
		NSString *priceSTring = [dataResponse objectForKey:@"price"];
		NSString *urlThumbnail = [dataResponse objectForKey:@"thumbnail"];

		self.id = idString;
		self.title = title;
		self.price = [priceSTring intValue];
		self.urlThumbnailImage = urlThumbnail;
	}
	return(self);
}

@end
