//
//  WebServices.h
//  HttpServerRequest
//
//  Created by Mehedi Hasan on 1/2/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebServices : NSObject

+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void(^)(NSData *, NSError*))block;

@end

NS_ASSUME_NONNULL_END
