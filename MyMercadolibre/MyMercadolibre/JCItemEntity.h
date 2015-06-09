//
//  JCItemEntity.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCItemEntity : NSObject

@property NSString *id;
@property NSString *title;
@property NSInteger price;
@property NSString *urlThumbnailImage;
@property NSMutableArray *arrayPictures;


- (id)initWithDataResponse:(NSDictionary *)dataResponse;

@end
