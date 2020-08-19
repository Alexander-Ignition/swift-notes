//
//  LegacyObject.h
//  Pool
//
//  Created by Alexander Ignatev on 18.08.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LegacyObject : NSObject

@property (nonatomic, assign) NSInteger ID;

+ (LegacyObject *)createWithID:(NSInteger)ID;

- (instancetype)initWithID:(NSInteger)ID;

- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
