//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by admin on 10/16/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var showNextAnimationButton: UIButton!
    @IBOutlet var springAnimatiomView: SpringView!
    @IBOutlet var label: UILabel!
    
    var animations: [AnimationType] = [AnimationType(animation: "pop",
                                                     curve: "easeIn",
                                                     force: 2,
                                                     duration: 1),
                                       AnimationType(animation: "swing",
                                                     curve: "linear",
                                                     force: 1.5,
                                                     duration: 1),
                                       AnimationType(animation: "shake",
                                                     curve: "easeInQuart",
                                                     force: 1,
                                                     duration: 2),
                                       AnimationType(animation: "squeeze",
                                                     curve: "spring",
                                                     force: 1.5,
                                                     duration: 1),
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        springAnimatiomView.layer.cornerRadius = 10
        showNextAnimationButton.layer.cornerRadius = 10
        
        setAnimationDescription(for: label, type: animations.first)
        
        showNextAnimationButton.setTitle(animations[1].animation, for: .normal)
    }

    @IBAction func showNextAnimation() {
        
        let animation = animations.removeFirst()
        animations.append(animation)
        
        setAnimation(for: springAnimatiomView, type: animation)
        setAnimationDescription(for: label, type: animations.first)
        
        showNextAnimationButton.setTitle(animations[1].animation, for: .normal)
    }
}

extension ViewController {
    
    private func setAnimation (for view: SpringView, type: AnimationType) {
        view.animation = type.animation
        view.curve = type.curve
        view.force = type.force
        view.duration = type.duration
        view.animate()
    }
    
    private func setAnimationDescription (for label: UILabel, type: AnimationType?) {
        if let type = type {
        label.text = """
        Animation: \(type.animation)
        Curve: \(type.curve)
        Force: \(type.force)
        Duration: \(type.duration)
        """
            
        }
    }
}
