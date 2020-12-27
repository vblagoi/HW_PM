//
//  ViewController.swift
//  Animation1
//
//  Created by Вова Благой on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: (view.frame.size.width - 50) / 2, y: (view.frame.size.height - 50) / 2, width: 50, height: 50))
        
        squareView.backgroundColor = .black
        
        view.addSubview(squareView)
        animate()
    }

    func animate() {
        UIView.animate(withDuration: 1.5, animations: {
            self.squareView.frame = CGRect(x: (self.view.frame.size.width - 100) / 2, y: (self.view.frame.size.height - 100) / 2, width: 100, height: 100)
        })
    }

}

