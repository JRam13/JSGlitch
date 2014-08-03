//
//  GameScene.m
//  JSGlitch
//
//  Created by JRamos on 8/2/14.
//  Copyright (c) 2014 Jonny Ramos. All rights reserved.
//

#import "GameScene.h"
#import "JSTileMap.h"

@interface GameScene () 

@property (strong, nonatomic) JSTileMap         *tiledMap;
@end


@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */

    _tiledMap = [JSTileMap mapNamed:@"Sky.tmx"];
    if (_tiledMap) {
        [self addChild:_tiledMap];
    }
    
    TMXLayer *cloudLayer1 = [_tiledMap layerNamed:@"CloudLayer1"];
    cloudLayer1.position = CGPointMake(0, 0);
    
    SKAction *scrollLeft = [SKAction moveByX:-200 y:0 duration:3];
    SKAction *scrollRight = [SKAction moveByX:200 y:0 duration:3];
    
    SKAction *reset = [SKAction runBlock:^{
        cloudLayer1.position = CGPointMake(0, 0);
    }];
    SKAction *sequence = [SKAction sequence:@[scrollLeft, scrollRight]];
    SKAction *repeat   = [SKAction repeatActionForever:sequence];
    
    [cloudLayer1 runAction:repeat];
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
