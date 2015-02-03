//
//  BFGraphicsUtilities.m
//  Moonlight
//
//  Created by 蝴蝶 on 15/1/15.
//  Copyright (c) 2015年 蝴蝶. All rights reserved.
//

#import "BFGraphicsUtilities.h"

#pragma mark- Rand float

CGFloat BFRandFloatBetweenNumbers(CGFloat low, CGFloat high){
    CGFloat randNumber = rand() / (CGFloat)RAND_MAX;
    return randNumber * (high - low) + low;
}

#pragma mark - Point Calculations
CGFloat BFDistanceBetweenPoints(CGPoint first, CGPoint second) {
    return hypotf(second.x - first.x, second.y - first.y);
}

CGFloat BFRadiansBetweenPoints(CGPoint first, CGPoint second) {
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return atan2f(deltaY, deltaX);
}

CGPoint BFPointByAddingCGPoints(CGPoint first, CGPoint second) {
    return CGPointMake(first.x + second.x, first.y + second.y);
}

#pragma mark - Loading from a Texture Atlas
NSArray *BFLoadFramesFromAtlas(NSString *atlasName, NSString *baseFileName, int numberOfFrames) {
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:numberOfFrames];
    
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:atlasName];
    for (int i = 1; i <= numberOfFrames; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%@%04d.png", baseFileName, i];
        SKTexture *texture = [atlas textureNamed:fileName];
        [frames addObject:texture];
    }
    
    return frames;
}

#pragma mark - Emitters
void BFRunOneShotEmitter(SKEmitterNode *emitter, CGFloat duration) {
    [emitter runAction:[SKAction sequence:@[
                                            [SKAction waitForDuration:duration],
                                            [SKAction runBlock:^{
        emitter.particleBirthRate = 0;
    }],
                                            [SKAction waitForDuration:emitter.particleLifetime + emitter.particleLifetimeRange],
                                            [SKAction removeFromParent],
                                            ]]];
}