//
//  SignNode.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/12/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class SignNode:SKNode{
    //private var sign: SKReferenceNode;
    private var sign: SKSpriteNode;
    private var valSymbol: SKSpriteNode;
    private var weedSymbol: SKSpriteNode;
    private var valText: SKLabelNode;
    private var weedText: SKLabelNode;
    private var value: Int;
    private var weeds: Int;
    
    init(pos: CGPoint, val: Int, weed: Int, size: CGSize){
        sign = SKSpriteNode(texture: nil, color: UIColor.white, size: size);
        sign.position = CGPoint(x: 0, y: 0);
        sign.zPosition = -1;
        valSymbol = SKSpriteNode(texture: nil, color: UIColor.green, size: CGSize(width: size.width * 0.36, height: size.height * 0.36));
        valSymbol.position = CGPoint(x: size.width * -0.3, y: size.width * 0.2);
        weedSymbol = SKSpriteNode(texture: nil, color: UIColor.red, size: CGSize(width: size.width * 0.36, height: size.height * 0.36));
        weedSymbol.position = CGPoint(x: size.width * -0.3, y: size.width * -0.2);
        
        valText = SKLabelNode(text: String(val));
        valText.position = CGPoint(x: size.width * 0.2, y: size.width * 0.2);
        valText.fontColor = UIColor.black;
        valText.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center;
        valText.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center;
        
        weedText = SKLabelNode(text: String(weed));
        weedText.position = CGPoint(x: size.width * 0.2, y: size.width * -0.2);
        weedText.fontColor = UIColor.black;
        weedText.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center;
        weedText.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center;
        
//        sign = SKReferenceNode(fileNamed: "SignPost.sks");
        value = val;
        weeds = weed;
        
//        let valueText: SKLabelNode = sign.childNode(withName: "//valueText") as! SKLabelNode;
//        valueText.text = String(value);
//        let weedsText: SKLabelNode = sign.childNode(withName: "//weedText") as! SKLabelNode;
//        weedsText.text = String(weeds);
        
        super.init();
        self.position = pos;
        self.insertChild(sign, at: 0);
        self.insertChild(valSymbol, at: 1);
        self.insertChild(weedSymbol, at: 2);
        self.insertChild(valText, at: 3);
        self.insertChild(weedText, at: 4);
//        sign.position = CGPoint(x: 0, y: 0);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getValue() -> Int{
        return value;
    }
    
    public func setValue(valueToAdd: Int){
        value += valueToAdd;
        valText.text = String(value);
    }
    
    public func getWeeds() -> Int{
        return weeds;
    }
    
    public func setWeeds(weedsToAdd: Int){
        weeds += weedsToAdd
        weedText.text = String(weeds);
    }
}
