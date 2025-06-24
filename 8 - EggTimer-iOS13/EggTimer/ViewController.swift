//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!


    var timer = Timer()
    var secondsRemaining = 60
    var totalTime = 0
    var secondsPassed = 0

    let eggTimes = [
        "Soft": 300,
        "Medium": 420,
        "Hard": 720
    ]
        
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()

        secondsPassed = 0
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness] ?? 60
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

    }
    
    @objc func updateCounter() {
            secondsPassed += 1
            let progressPercentage = Float(secondsPassed) / Float(totalTime)
            
            // Atualiza a barra de progresso
            progressBar.progress = progressPercentage
            
            // Verifica se o tempo acabou
            if secondsPassed >= totalTime {
                timer.invalidate()
                progressBar.progress = 1.0 // Garante que a barra fique completa
                titleLabel.text = "DONE!"
                playSound(soundName: "alarm_sound")
            }
        }
    
    func playSound(soundName: String, type: String = "mp3") {
        let url = Bundle.main.url(forResource: soundName, withExtension: type)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
