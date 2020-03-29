//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 7]
    var secondsRemaining = 0
    var secondsPassed = 0
    var totalSeconds = 0
    var timer = Timer()
    
//    let softTime =  5
//    let mediumTime = 7
//    let hardTime = 12

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        let hardness = sender.currentTitle!
        let result = eggTimes[hardness]!
        //print("\(result)")
        secondsRemaining = result
        totalSeconds = result
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        //
        
//        let filter = eggTimes.filter { $0.key == hardness}
//
//        if(hardness == "Soft"){
//            print("\(filter.first?.value)")
//        }else if(hardness == "Medium"){
//            print("\(filter.first?.value)")
//        }else if(hardness == "Hard"){
//            print("\(filter.first?.value)")
//        }
        
//        if(hardness == "Soft"){
//            print("\(softIME)")
//        }else if(hardness == "Medium"){
//            print("\(mediumTime)")
//        }else if(hardness == "Hard"){
//            print("\(hardTime)")
//        }
    }
    
    @objc func updateCounter() {
        //example functionality
//        if secondsRemaining > 0 {
//            print("\(secondsRemaining) seconds.")
//            secondsRemaining -= 1
//            secondsPassed += 1
//            var percentageProgress = secondsPassed / totalSeconds
//
//            DispatchQueue.main.asyncAfter(deadline: .now()) {  self.progressBar.progress = percentageProgress
//            }
//
//        }else{
//            timer.invalidate()
//            titleLabel.text = "DONE!"
//        }
        if secondsPassed < totalSeconds {
            
            secondsPassed += 1
            
            let percentageProgress = Float(secondsPassed) / Float(totalSeconds)
            progressBar.progress = percentageProgress
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
