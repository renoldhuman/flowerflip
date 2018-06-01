//
//  DirtPrefab.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/10/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class Dirt: SKNode{
    
    init(parentSize : CGSize){
        let dirtTexture: SKTexture = SKTexture(image: #imageLiteral(resourceName: "CPenDirt"));
        let moundTexture: SKTexture = SKTexture(image: #imageLiteral(resourceName: "CPenMound"));
        
        
        var sproutString: String?;
        
        let n: Int = Int(arc4random_uniform(3));
        
        switch n {
        case 0:
            sproutString = "Sprout A.png";
        case 1:
            sproutString = "Sprout B.png";
        case 2:
            sproutString = "Sprout C.png";
        default:
            sproutString = "Sprout A.png";
        }
        
        let sproutTexture: SKTexture = SKTexture(imageNamed: sproutString!);
        
        let dirt: SKSpriteNode = SKSpriteNode(texture: dirtTexture, size: parentSize);
        let mound: SKSpriteNode = SKSpriteNode(texture: moundTexture, size: parentSize);
        let sprout: SKSpriteNode = SKSpriteNode(texture: sproutTexture, size: CGSize(width: parentSize.width * 0.3, height: parentSize.height * 0.402));
        
        dirt.position = CGPoint(x: 0, y: 0);
        dirt.zPosition = -4;
        mound.position = CGPoint(x: 0, y: 0);
        mound.zPosition = -3;
        sprout.position = CGPoint(x: 0, y: 1);
        sprout.zPosition = -1;
        
        super.init();
        
        self.insertChild(dirt, at: 0);
        self.insertChild(mound, at: 1);
        self.insertChild(sprout, at: 2);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
