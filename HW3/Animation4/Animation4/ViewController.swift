//
//  ViewController.swift
//  Animation4
//
//  Created by Вова Благой on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: UIView!
    var firstCircleView: UIView!
    var secondCircleView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = UIView(frame: CGRect(x: (view.frame.size.width - 275)/2 , y: (view.frame.size.height - 275)/2, width: 275, height: 275))
        
        
        view.addSubview(mainView)
        
        
        firstCircleView = UIView(frame: CGRect(x: (mainView.frame.size.width - 150)/2 , y: (mainView.frame.size.height - 25)/2, width: 150, height: 150))
        firstCircleView.backgroundColor = .green
        firstCircleView.layer.cornerRadius = 75
        
        mainView.addSubview(firstCircleView)
        
        secondCircleView = UIView(frame: CGRect(x: (mainView.frame.size.width - 150)/2 , y: (mainView.frame.size.height - 275)/2, width: 150, height: 150))
        secondCircleView.backgroundColor = .systemGreen
        secondCircleView.layer.cornerRadius = 75
        
        mainView.addSubview(secondCircleView)
        
        animate()
    }

    func animate() {
        UIView.animate(withDuration: 1, animations: {
            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 1, animations: {
                    self.mainView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi * 2)
                })
            }
        })
    }

}

