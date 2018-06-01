//
//  TransparentPrefab.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/10/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class Touch: SKSpriteNode{
    
    init(parentSize : CGSize){
        super.init(texture: nil, color: UIColor.white, size: parentSize);
        self.position = CGPoint(x: 0,y: 0);
        self.zPosition = 0;
        self.alpha = 0.01;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
}
