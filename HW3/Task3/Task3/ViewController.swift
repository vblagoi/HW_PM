//
//  ViewController.swift
//  Task3
//
//  Created by Вова Благой on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {

    var circleView: UIView!
    var rotatingView: UIView!
    var colorArray: Array<UIColor> = [.yellow, .orange, .red, .blue, .green, .purple]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rotatingView = UIView(frame: CGRect(x: (view.frame.size.width - 160)/2 , y: (view.frame.size.height)/2, width: 160, height: 160))
        rotatingView.backgroundColor = .black
        view.addSubview(rotatingView)
        
        // create circle
        circleView = UIView(frame: CGRect(x: (rotatingView.frame.size.width - 40)/2 , y: (rotatingView.frame.size.height - 200)/2, width: 40, height: 40))
        circleView.backgroundColor = .red
        circleView.layer.cornerRadius = 20
        rotatingView.addSubview(circleView)
        


        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeRecognizer))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeRecognizer))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeRecognizer))
        swipeUp.direction = .up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipeRecognizer))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapRecognizer))
        view.addGestureRecognizer(tapRecognizer)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        

    }
    
    @objc func handleSwipeRecognizer(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .down:
            animateDown()
        case .up:
            animateUp()
        case .left:
            animateLeft()
        case .right:
            animateRight()
        default:
            break
        }
    }
    
    @objc func handleTapRecognizer(sender: UITapGestureRecognizer) {
        animateReturnePosition()
    }
    
    @objc func doubleTapped() {
        animateReturnePosition()
        animateRotating()
    }
    
    func changeColore (item: UIView) {
        let color = item.backgroundColor
        repeat {
            item.backgroundColor = colorArray.randomElement()
        } while color == item.backgroundColor
    }
    
    func animateDown() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.frame.origin.y += 30
            self.changeColore(item: self.circleView)
           })
    }
    
    func animateUp() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.frame.origin.y -= 30
            self.changeColore(item: self.circleView)
           })
    }
    
    func animateRight() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.frame.origin.x += 30
            self.changeColore(item: self.circleView)
           })
    }
    
    func animateLeft() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.frame.origin.x -= 30
            self.changeColore(item: self.circleView)
           })
    }
    
    func animateReturnePosition() {
        UIView.animate(withDuration: 1.5, animations: {
            self.circleView.frame.origin.x = (self.rotatingView.frame.size.width - 40)/2
            self.circleView.frame.origin.y = (self.rotatingView.frame.size.height - 120)/2
        })
    }
    
    func animateRotating() {
        UIView.animate(withDuration: 1.5, delay: 1.5, options: .curveEaseIn, animations: {
            self.rotatingView.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 1.5, animations: {
                    self.rotatingView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
                })
            }
        })

    }


}

