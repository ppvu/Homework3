//
//  ViewController.swift
//  Homework 3. Task 3
//
//  Created by spezza on 27.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentColor: UIColor = .systemRed
    
    
    let colors: [UIColor] = [
        .systemYellow,
        .systemOrange,
        .systemRed,
        .systemBlue,
        .systemGreen,
        .systemPurple
    ]

    
    
    //Make some views
    
    lazy var circleView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.layer.cornerRadius = view.frame.height / 2
        view.backgroundColor = colors[2]
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makingViews()
        makingGestures()
    }
    
    //Here is some functions

    func makingViews() {
        view.backgroundColor = .white
        
        view.addSubview(circleView)
        circleView.center = view.center
    }
    
    func makingGestures() {
        let tapping = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
        tapping.numberOfTouchesRequired = 1
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.handleDoubleTap(_ :)))
        doubleTap.numberOfTapsRequired = 2
        tapping.require(toFail: doubleTap)
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(_:)))
        
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        swipeUp.direction = .up
        swipeDown.direction = .down
        
        
        view.isUserInteractionEnabled = true
        
        view.addGestureRecognizer(tapping)
        view.addGestureRecognizer(doubleTap)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        
    }
    
    //ACTION!
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut, animations: {
            self.circleView.center = self.view.center
        })
        
        animator.startAnimation()
    }
    
    
    @objc func handleDoubleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        let isCentered = self.circleView.center == self.view.center
        
        let animator = UIViewPropertyAnimator(duration: isCentered ? 0 : 1.5, curve: .easeInOut, animations: {
            self.circleView.center = self.view.center
        })
        
        animator.addCompletion {_ in
            
            guard self.circleView.center == self.view.center else { return }
            
            UIView.animateKeyframes(withDuration: 3, delay: 0, animations: {
    
                let points = 1000
                let radius = CGFloat(80)
                let slice = 2 * CGFloat.pi / CGFloat(points)
                
                

                for i in 0...points {
                    
                    let angle = slice * CGFloat(i)
                    let y = self.view.center.y - radius + radius * CGFloat(cos(angle))
                    let x = self.view.center.x + radius * CGFloat(sin(angle))
                    
                    

                    
                    let duration = 1 / Double(points)
                    let startTime = duration * Double(i)
                    
                    
                    UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: duration) {
                        
                        self.circleView.center = CGPoint(x: x, y: y)
                    }
                }
            }, completion: { isFinished in
                if isFinished {
                    self.circleView.center = self.view.center
                }
            })
        }
        
        animator.startAnimation()
    }
    
    @objc func handleSwipe(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        if gestureRecognizer.state == .ended {
            let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeInOut, animations: {
                
                switch gestureRecognizer.direction {
                case .up:
                    self.circleView.center.y -= 30
                case .down:
                    self.circleView.center.y += 30
                case .left:
                    self.circleView.center.x -= 30
                default:
                    self.circleView.center.x += 30
                }
                
                self.currentColor = self.colors.filter({ $0 != self.currentColor }).randomElement() ?? self.colors[2]
                
                self.circleView.backgroundColor = self.currentColor
            })
              
            animator.startAnimation()
        }
    }
}


