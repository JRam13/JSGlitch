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
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Avenir"];
    
    myLabel.text = @"Tap Here";
    myLabel.fontSize = 20;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];

    _tiledMap = [JSTileMap mapNamed:@"Sky.tmx"];
    if (_tiledMap) {
        [self addChild:_tiledMap];
    }
    
    TMXLayer *cloudLayer1 = [_tiledMap layerNamed:@"CloudLayer1"];
    cloudLayer1.position = CGPointMake(0, 0);
    
    SKAction *scrollLeft = [SKAction moveByX:-1024 y:0 duration:3];
//    SKAction *scrollRight = [SKAction moveByX:200 y:0 duration:3];
    
    SKAction *reset = [SKAction runBlock:^{
        cloudLayer1.position = CGPointMake(0, 0);
    }];
    SKAction *sequence = [SKAction sequence:@[scrollLeft, reset]];
    SKAction *repeat   = [SKAction repeatActionForever:sequence];
    
    [cloudLayer1 runAction:repeat];
    
    
    
    TMXLayer *cloudLayer2 = [_tiledMap layerNamed:@"CloudLayer2"];
    cloudLayer2.position = CGPointMake(0, 0);
    
    SKAction *scrollLeft2 = [SKAction moveByX:-1024 y:0 duration:3];
//    SKAction *scrollRight2 = [SKAction moveByX:200 y:0 duration:3];
    
    SKAction *reset2 = [SKAction runBlock:^{
        cloudLayer2.position = CGPointMake(0, 0);
    }];
    SKAction *sequence2 = [SKAction sequence:@[scrollLeft2, reset2]];
    SKAction *repeat2   = [SKAction repeatActionForever:sequence2];
    
    [cloudLayer2 runAction:repeat2];
    
    
    TMXLayer *cloudLayer3 = [_tiledMap layerNamed:@"CloudLayer3"];
    cloudLayer3.position = CGPointMake(0, 0);
    
    SKAction *scrollLeft3 = [SKAction moveByX:-1024 y:0 duration:3];
//    SKAction *scrollRight3 = [SKAction moveByX:200 y:0 duration:3];
    
    SKAction *reset3 = [SKAction runBlock:^{
        cloudLayer3.position = CGPointMake(0, 0);
    }];
    SKAction *sequence3 = [SKAction sequence:@[scrollLeft3, reset3]];
    SKAction *repeat3   = [SKAction repeatActionForever:sequence3];
    
    [cloudLayer3 runAction:repeat3];
    
    
    
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        for (int i=0; i<130; i++) {
            
            CGPoint location = [touch locationInNode:self];
            
            SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
            
            sprite.xScale = 0.5;
            sprite.yScale = 0.5;
            sprite.position = CGPointMake([self randomNumberBetweenMin:0 andMax:1024], [self randomNumberBetweenMin:0 andMax:768]);
            
            SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
            
            [sprite runAction:[SKAction repeatActionForever:action]];
            
            [self addChild:sprite];
            
        }

    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (NSInteger)randomNumberBetweenMin:(NSInteger)min andMax:(NSInteger)max
{
    return min + arc4random() % (max - min);
}


@end
