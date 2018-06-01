//
//  PlotNode.swift
//  minekross
//
//  Created by Tyler Helmrich on 5/10/18.
//  Copyright © 2018 Tyler Helmrich. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlotNode : SKNode{
    //ANIMATION VARIABLE TO GO HERE
    private var isFlipped : Bool
    private var value : Int
    private var groundLayer : Dirt
    private var weedFlag : Flag
    private var yellowFlag: Flag
    private var greenFlag: Flag
    private var purpleFlag: Flag
    private var touchLayer : Touch
    
    init(value : Int, pos : CGPoint, size: CGSize){
        self.isFlipped = false;
        self.value = value;
        self.groundLayer = Dirt(parentSize: size);
        self.weedFlag = Flag(parentSize: size, color: UIColor.red, pos: CGPoint(x: size.width * -0.25, y: size.width * 0.25));
        self.yellowFlag = Flag(parentSize: size, color: UIColor.yellow, pos: CGPoint(x: size.width * 0.25, y: size.width * 0.25));
        self.greenFlag = Flag(parentSize: size, color: UIColor.green, pos: CGPoint(x: size.width * -0.25, y: size.width * -0.25));
        self.purpleFlag = Flag(parentSize: size, color: UIColor.purple, pos: CGPoint(x: size.width * 0.25, y: size.width * -0.25));
        self.touchLayer = Touch(parentSize: size);
        
        super.init();
//        self.alpha = 0.0;
        self.position = pos;
        setAllFlagsHidden();
        self.insertChild(groundLayer, at: 0);
        self.insertChild(weedFlag, at: 1);
        self.insertChild(yellowFlag, at: 1);
        self.insertChild(greenFlag, at: 1);
        self.insertChild(purpleFlag, at: 1);
        self.insertChild(touchLayer, at: 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func flipNode() -> Int{
        isFlipped = !isFlipped;
        //Need To fill in animations here
        //THE FOLLOWING IS TEMPORARY ANIMATION UNTIL ART PREFABS ARE DONE
        //set all flags false here ->
        setAllFlagsHidden();
        print("fill in here");
//        if(value == 0){
//            groundLayer.color = UIColor.red;
//        }else if(value == 1){
//            groundLayer.color = UIColor.yellow;
//        }else if(value == 2){
//            groundLayer.color = UIColor.green;
//        }else{
//            groundLayer.color = UIColor.purple;
//        }
        return value;
    }
    
    public func setFlag(color: Int){
        switch color {
        case 0:
            weedFlag.setHidden();
        case 1:
            yellowFlag.setHidden();
        case 2:
            greenFlag.setHidden();
        case 3:
            purpleFlag.setHidden();
        default:
            print("Not a proper flag");
        }
    }
    
    public func setAllFlagsHidden(){
        weedFlag.setFlagFalse();
        yellowFlag.setFlagFalse();
        greenFlag.setFlagFalse();
        purpleFlag.setFlagFalse();
    }
    
    public func getFlipped() -> Bool{
        return isFlipped;
    }
    
    public func getValue() -> Int{
        return value;
    }
    
    public func setValue(val: Int){
        value = val;
    }
    
}
