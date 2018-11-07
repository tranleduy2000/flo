//
//  CounterView.swift
//  Flo
//
//  Created by duy on 11/7/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8;
        static let lineWidth: CGFloat = 5.0;
        static let arcWidth: CGFloat = 76;
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2;
        }
    }
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if (counter <= Constants.numberOfGlasses){
                setNeedsDisplay();
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blue;
    @IBInspectable var counterColor: UIColor = UIColor.orange;
    
    override func draw(_ rect: CGRect) {
        let center: CGPoint = CGPoint(x: bounds.width / 2, y: bounds.height / 2);
        print(center);
        let radius: CGFloat = min(bounds.width, bounds.height) / 2;
        print(radius)
        let startAngle: CGFloat = 3 * .pi / 4;
        let endAngle: CGFloat = .pi / 4;
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - Constants.arcWidth / 2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true);
        
        path.lineWidth = Constants.arcWidth;
        counterColor.setStroke();

        path.stroke();
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle;
        let arcLengthPerClass = angleDifference / CGFloat(Constants.numberOfGlasses);
        let outlineEndAngle = arcLengthPerClass * CGFloat(counter) + startAngle;
        
        //draw outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: radius - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true);
        
        //inner arc
        outlinePath.addArc(withCenter: center,
                           radius: radius - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        outlinePath.close();
        
        outlinePath.lineWidth = Constants.lineWidth;
        outlineColor.setStroke();
        outlinePath.stroke();
    }

}
