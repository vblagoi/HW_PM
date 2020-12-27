//
//  ViewController.swift
//  Animation3
//
//  Created by Вова Благой on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {

    var squareView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: (view.frame.size.width - 50) / 2, y: (view.frame.size.height - 50) / 2, width: 50, height: 50))
        
        squareView.backgroundColor = .blue
        
        view.addSubview(squareView)
        animate()
    }

    func animate() {
        UIView.animate(withDuration: 1.5, animations: {
            self.squareView.layer.cornerRadius = 25
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 1.5, animations: {
                    self.squareView.layer.cornerRadius = 0
                })
            }
        })
    }

}

