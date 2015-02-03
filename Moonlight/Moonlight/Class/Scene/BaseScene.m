//
//  BaseScene.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/14.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "BaseScene.h"

@interface BaseScene ()

@property (nonatomic, strong) NSMutableArray *entityArray;

@end

@implementation BaseScene

@synthesize entitys = _entitys;

- (instancetype)initWithSize:(CGSize)size {
    self = [super initWithSize:size];
    if (self) {
        _entityArray = [@[] mutableCopy];
    }
    
    return self;
}

- (NSArray *)entitys {
    return _entityArray;
}

- (void)addEntity:(Entity *)entity {
    [_entityArray addObject:entity];
}

- (void)removeEntity:(Entity *)entity {
    [_entityArray removeObject:entity];
}

@end
