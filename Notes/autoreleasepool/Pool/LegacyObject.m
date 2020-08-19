//
//  LegacyObject.m
//  Pool
//
//  Created by Alexander Ignatev on 18.08.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

#import "LegacyObject.h"

@implementation LegacyObject

+ (LegacyObject *)createWithID:(NSInteger)ID
{
    return [[[self alloc] initWithID:ID] autorelease];
}

- (instancetype)initWithID:(NSInteger)ID
{
    self = [super init];
    if (self) {
        self.ID = ID;
        NSLog(@"%s ID = %ld", __func__, self.ID);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%s ID = %ld", __func__, self.ID);
    [super dealloc];
}

@end
