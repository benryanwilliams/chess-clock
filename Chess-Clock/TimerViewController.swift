//
//  TimerViewController.swift
//  Chess Clock
//
//  Created by Ben Williams on 07/11/2020.
//  Copyright © 2020 Ben Williams. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var whiteTimeLabel: UIButton!
    @IBOutlet weak var blackTimeLabel: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    var whiteIsActive = false
    var blackIsActive = false
    
    var timeInMinutes: Int = 0
    var incrementInSeconds: Int = 0
    
    let timeToGoRed = 31 * 1000
    
    var mainTimer : Timer?
    
    var totalWhiteSecondsRemaining = 0 {
        // Set colour of black side's text to red when the timer hits 50 seconds and set background to red and text to black when the timer hits 0 seconds
        didSet {
            setWhiteColoursWhileActive()
        }
    }
    
    var totalBlackSecondsRemaining = 0 {
        // Set colour of black side's text to red when the timer hits 50 seconds and set background to red and text to black when the timer hits 0 seconds
        didSet {
            setBlackColours()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds long press gesture recogniser to the 'Hold to go back' button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(backButtonLongTap))
        longGesture.minimumPressDuration = 1
        backButton.addGestureRecognizer(longGesture)
        
        let monospacedFont = UIFont.monospacedDigitSystemFont(ofSize: 81, weight: UIFont.Weight.heavy)
        whiteTimeLabel.titleLabel?.font = monospacedFont
        blackTimeLabel.titleLabel?.font = monospacedFont
        
        totalWhiteSecondsRemaining = timeInMinutes * 60 * 1000
        updateWhiteTimer(with: totalWhiteSecondsRemaining)
        
        totalBlackSecondsRemaining = timeInMinutes * 60 * 1000
        updateBlackTimer(with: totalBlackSecondsRemaining)
    }
    
    // MARK:- Black and White Button IBActions
    
    @IBAction func whitePressed(_ sender: UIButton) {
        
        if !whiteIsActive && !blackIsActive {
            startBlackTimer()
            blackIsActive = true
            
        } else if whiteIsActive {
            stopWhiteTimer()
            whiteIsActive = false
            
            startBlackTimer()
            blackIsActive = true
            
            setColoursWhenWhitePressed()
            
        }
    }
    
    @IBAction func blackPressed(_ sender: UIButton) {
        
        if !whiteIsActive && !blackIsActive {
            startWhiteTimer()
            whiteIsActive = true
            
        } else if blackIsActive {
            stopBlackTimer()
            blackIsActive = false
            
            startWhiteTimer()
            whiteIsActive = true
            
            setColoursWhenBlackPressed()
        }
    }
    
    // MARK:- White Timer methods
    
    func startWhiteTimer() {
        if mainTimer == nil {
            mainTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(whiteTimerFired), userInfo: nil, repeats: true)
        }
    }
    
    func stopWhiteTimer() {
        if mainTimer != nil {
            mainTimer!.invalidate()
            totalWhiteSecondsRemaining += incrementInSeconds
            updateWhiteTimer(with: totalWhiteSecondsRemaining)
            mainTimer = nil
        }
    }
    
    @objc func whiteTimerFired() {
        if self.totalWhiteSecondsRemaining > 0 {
            self.totalWhiteSecondsRemaining -= 1
            
            updateWhiteTimer(with: totalWhiteSecondsRemaining)
        }
        else {
            mainTimer?.invalidate()
        }
    }
    
    func updateWhiteTimer(with secs: Int) {
        let minutes = Int(secs) / 1000 / 60 % 60
        let seconds = Int(secs) / 1000 % 60
        let tenths = (Int(secs) / 10 % 100) / 10
        
        if totalWhiteSecondsRemaining < 10000 {
            let currentTime = String(format: "%02i:%02i:%1i", minutes, seconds, tenths)
            self.whiteTimeLabel.setTitle(String(currentTime), for: UIControl.State.normal)
        }
        else {
            let currentTime = String(format: "%02i:%02i", minutes, seconds)
            self.whiteTimeLabel.setTitle(String(currentTime), for: UIControl.State.normal)
        }
        
        
    }
    
    func setWhiteColoursWhileActive() {
        if totalWhiteSecondsRemaining == timeToGoRed {
            whiteTimeLabel.setTitleColor(.red, for: .normal)
        }
        if totalWhiteSecondsRemaining == 0 {
            whiteTimeLabel.setTitleColor(.white, for: .normal)
            whiteTimeLabel.backgroundColor = .red
            whiteTimeLabel.isUserInteractionEnabled = false
        }
    }
    
    func setColoursWhenWhitePressed() {
        if totalBlackSecondsRemaining <= timeToGoRed {
            blackTimeLabel.setTitleColor(.red, for: .normal)
        }
        if totalBlackSecondsRemaining == 0 {
            blackTimeLabel.setTitleColor(.black, for: .normal)
            blackTimeLabel.isUserInteractionEnabled = false
        }
        else {
            whiteTimeLabel.setTitleColor(.black, for: .normal)
        }
    }
    
    // MARK:- Black Timer methods
    
    func startBlackTimer() {
        if mainTimer == nil {
            mainTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(blackTimerFired), userInfo: nil, repeats: true)
        }
    }
    
    func stopBlackTimer() {
        if mainTimer != nil {
            mainTimer!.invalidate()
            totalBlackSecondsRemaining += incrementInSeconds
            updateBlackTimer(with: totalBlackSecondsRemaining)
            mainTimer = nil
        }
    }
    
    @objc func blackTimerFired() {
        if self.totalBlackSecondsRemaining > 0 {
            self.totalBlackSecondsRemaining -= 1
            
            updateBlackTimer(with: totalBlackSecondsRemaining)
        }
        else {
            mainTimer?.invalidate()
        }
    }
    
    func updateBlackTimer(with secs: Int) {
        let minutes = Int(secs) / 1000 / 60 % 60
        let seconds = Int(secs) / 1000 % 60
        let tenths = (Int(secs) / 10 % 100) / 10
        
        if totalBlackSecondsRemaining < 10000 {
            let currentTime = String(format: "%02i:%02i:%1i", minutes, seconds, tenths)
            self.blackTimeLabel.setTitle(String(currentTime), for: UIControl.State.normal)
        }
        else {
            let currentTime = String(format: "%02i:%02i", minutes, seconds)
            self.blackTimeLabel.setTitle(String(currentTime), for: UIControl.State.normal)
        }
    }
    
    func setBlackColours() {
        if totalBlackSecondsRemaining == timeToGoRed {
            blackTimeLabel.setTitleColor(.red, for: .normal)
        }
        if totalBlackSecondsRemaining == 0 {
            blackTimeLabel.setTitleColor(.black, for: .normal)
            blackTimeLabel.backgroundColor = .red
            blackTimeLabel.isUserInteractionEnabled = false
        }
    }
    
    func setColoursWhenBlackPressed() {
        if totalWhiteSecondsRemaining <= timeToGoRed {
            whiteTimeLabel.setTitleColor(.red, for: .normal)
        }
        if totalWhiteSecondsRemaining == 0 {
            whiteTimeLabel.setTitleColor(.white, for: .normal)
            whiteTimeLabel.isUserInteractionEnabled = false
        }
        else {
            blackTimeLabel.setTitleColor(.white, for: .normal)
        }
    }
    
    // MARK:- Back Button methods
    
    @objc func backButtonLongTap(_ sender: UIGestureRecognizer){
        if sender.state == .began {
            
            // Create alert and actions allowing user to go back to settings screen when back button is long pressed
            let alert = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
                self.dismiss(animated: true) {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(yesAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
}
