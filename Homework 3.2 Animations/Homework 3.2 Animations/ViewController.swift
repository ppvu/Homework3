//
//  ViewController.swift
//  Homework 3.2 Animations
//
//  Created by spezza on 24.12.2020.
//

import UIKit

class ViewController: UIViewController {
    //1
    @IBOutlet weak var firstBox: UIView!
    
    //2
    @IBOutlet weak var boxColor: UIView!
    @IBOutlet weak var circleColor: UIView!
    
    //3
    @IBOutlet weak var thirdBox: UIView!
    
    //4
    @IBOutlet weak var rotatingArea: UIView!
    @IBOutlet weak var topCircle: UIView!
    @IBOutlet weak var bottomCircle: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        
        setupAnimations()
   
    }

    
    func setupViews() {
        circleColor.layer.cornerRadius = circleColor.frame.height / 2
        topCircle.layer.cornerRadius = topCircle.frame.height / 2
        bottomCircle.layer.cornerRadius = bottomCircle.frame.height / 2
    }
    
    func setupAnimations() {
        animateScaling()
        animateChangingColors()
        animateSquareToCircle()
        animateRotation()
    }
    
    //1
    func animateScaling() {
        
        UIView.animate(
            withDuration: 2.5,
            delay: 0,
            options: [.repeat, .autoreverse],
            animations: {
                let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.firstBox.transform = scale
           }
        )
    }
    //2
    func animateChangingColors() {
        
        let boxColors: [UIColor] = [.black, .red, .green, .orange, .white, ]
        let circleColors: [UIColor] = [.white, .blue, .yellow, .systemPink, .black]
        
        var currentColorIndex = 0
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [.calculationModeCubic, .repeat] , animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.boxColor.backgroundColor = boxColors[currentColorIndex]
                self.circleColor.backgroundColor = circleColors[currentColorIndex]
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                currentColorIndex += 1
                self.boxColor.backgroundColor = boxColors[currentColorIndex]
                self.circleColor.backgroundColor = circleColors[currentColorIndex]
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                currentColorIndex += 1
                self.boxColor.backgroundColor = boxColors[currentColorIndex]
                self.circleColor.backgroundColor = circleColors[currentColorIndex]
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                currentColorIndex += 1
                self.boxColor.backgroundColor = boxColors[currentColorIndex]
                self.circleColor.backgroundColor = circleColors[currentColorIndex]
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.boxColor.backgroundColor = boxColors[currentColorIndex]
                self.circleColor.backgroundColor = circleColors[currentColorIndex]
            }

        })
    }
    
    //3
    func animateSquareToCircle() {
        
        UIView.animate(
            withDuration: 4.0,
            delay: 0,
            options: [.repeat, .autoreverse],
            animations: {
                self.thirdBox.layer.cornerRadius = self.thirdBox.frame.height / 2
           }
        )
    }
    
    //4
    func animateRotation() {
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.5,
            options: .curveLinear,
            animations: {
                let rotation = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.rotatingArea.transform = rotation
            }, completion: { _ in
                UIView.animate(
                    withDuration: 1,
                    delay: 0.5,
                    options: .curveLinear,
                    animations: {
                        let rotation = CGAffineTransform(rotationAngle: -2 * CGFloat.pi)
                        self.rotatingArea.transform = rotation
                    }, completion: { _ in self.animateRotation()}
                )
            }
        )
    }
}

