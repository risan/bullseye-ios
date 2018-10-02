//
//  ViewController.swift
//  Bullseye
//
//  Created by Risan Bagja Pradana  on 30092018.
//  Copyright © 2018 Risan Bagja Pradana . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let trackInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let minTrackImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let minTrackResizableImage = minTrackImage.resizableImage(withCapInsets: trackInsets)
        slider.setMinimumTrackImage(minTrackResizableImage, for: .normal)
        
        let maxTrackImage = #imageLiteral(resourceName: "SliderTrackRight")
        let maxTrackResizableImage = maxTrackImage.resizableImage(withCapInsets: trackInsets)
        slider.setMaximumTrackImage(maxTrackResizableImage, for: .normal)
        
        startNewRound()
    }
    
    @IBAction func hitMe() {
        let points = calculatePoints()
        score += points
        
        let alert = UIAlertController(title: getPointsDescription(points), message: "Your points: \(points)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver() {
        let alert = UIAlertController(title: "Start Over", message: "Are you sure?", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Yes", style: .destructive, handler: {
            action in
            self.reset()
        })
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(confirm)
        
        present(alert, animated: true, completion: nil)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        slider.value = 50.0
        updateLabels()
    }
    
    func reset() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func calculatePoints() -> Int {
        let sliderValue = Int(slider.value.rounded())
        let difference = abs(targetValue - sliderValue);
        
        if (difference == 0) {
            return 200
        } else if (difference == 1) {
            return 149
        }
        
        return 100 - difference
    }
    
    func getPointsDescription(_ points: Int) -> String {
        if (points == 100) {
            return "Perfect!"
        } else if (points >= 95) {
            return "You almost had it!"
        } else if (points >= 90) {
            return "That was close!"
        }
        
        return "That was okay"
    }
    
}

