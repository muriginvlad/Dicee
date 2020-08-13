//
//  ViewController.swift
//  Dicee
//
//  Created by Владислав on 25/06/2019.
//  Copyright © 2019 Murygin Vladislav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceeArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    var rendomDiceeIndex1 = 0
    var rendomDiceeIndex2 = 0
    
    @IBOutlet var rollButton: UIButton!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomDiceImages()
        
        rollButton.layer.cornerRadius = rollButton.frame.size.height / 4
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        rotateImage(image: diceImageView1)
        rotateImage(image: diceImageView2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            self.randomDiceImages()
        })
        
        
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        randomDiceImages()
    }
    
    
    func randomDiceImages() {
        
        rendomDiceeIndex1 = Int.random(in: 0...5)
        rendomDiceeIndex2 = Int.random(in: 0...5)
        
        diceImageView1.image = UIImage(named: diceeArray[rendomDiceeIndex1])
        diceImageView2.image = UIImage(named: diceeArray[rendomDiceeIndex2])
    }
    
    func rotateImage(image: UIImageView) {
        UIView.animate(withDuration: 1, animations: {
            image.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            image.transform = CGAffineTransform.identity
            image.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            image.transform = CGAffineTransform.identity
        }) { (completed) in
            //  rotateImage(image: image)
        }
    }
    
}

