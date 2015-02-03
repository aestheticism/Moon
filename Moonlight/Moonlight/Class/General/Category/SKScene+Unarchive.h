//
//  SKScene+Unarchive.h
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/9.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file;

@end
