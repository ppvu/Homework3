//
//  ViewController.swift
//  hw3.size classes
//
//  Created by spezza on 22.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var firstStackView: UIStackView!
    @IBOutlet var secondStackView: UIStackView!
    
    

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        guard UIDevice.current.userInterfaceIdiom == .pad else { return }
        
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown:
            firstStackView.axis = .vertical
            secondStackView.axis = .vertical
        case .landscapeLeft, .landscapeRight:
            firstStackView.axis = .horizontal
            secondStackView.axis = .horizontal
        default: {}()

        }
    }
}


