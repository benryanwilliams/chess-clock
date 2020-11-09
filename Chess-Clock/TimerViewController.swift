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
    
    var totalWhiteSecondsRemaining = 1000
    var totalBlackSecondsRemaining = 1000
    
    var mainTimer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds long press gesture recogniser to the 'Hold to go back' button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(backButtonLongTap))
        longGesture.minimumPressDuration = 1
        backButton.addGestureRecognizer(longGesture)
        
    }
    
    @IBAction func whitePressed(_ sender: UIButton) {
        
        if !whiteIsActive && !blackIsActive {
            startBlackTimer()
            blackIsActive = true
            
        } else if whiteIsActive {
            stopWhiteTimer()
            whiteIsActive = false
            
            startBlackTimer()
            blackIsActive = true
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
        }
        
    }
    
    // MARK:- White Timer functions
    
    func startWhiteTimer()
    {
        if mainTimer == nil {
            mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(whiteTimerFired), userInfo: nil, repeats: true)
        }
    }
    
    func stopWhiteTimer()
    {
        if mainTimer != nil {
            mainTimer!.invalidate()
            mainTimer = nil
        }
    }
    
    @objc func whiteTimerFired() {
        if self.totalWhiteSecondsRemaining > 0 {
            self.totalWhiteSecondsRemaining -= 1
            
            let minutes = Int(self.totalWhiteSecondsRemaining) / 60 % 60
            let seconds = Int(self.totalWhiteSecondsRemaining) % 60
            
            let currentTime = String(format: "%02i:%02i", minutes, seconds)
            self.whiteTimeLabel.setTitle(String(currentTime), for: UIControl.State.normal)
            
        }
        else {
            mainTimer?.invalidate()
        }
    }
    
    // MARK:- Black Timer functions
    
    func startBlackTimer()
    {
        if mainTimer == nil {
            mainTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(blackTimerFired), userInfo: nil, repeats: true)
        }
    }
    
    func stopBlackTimer()
    {
        if mainTimer != nil {
            mainTimer!.invalidate()
            mainTimer = nil
        }
    }
    
    @objc func blackTimerFired() {
        if self.totalBlackSecondsRemaining > 0 {
            self.totalBlackSecondsRemaining -= 1
            
            let minutes = Int(self.totalBlackSecondsRemaining) / 60 % 60
            let seconds = Int(self.totalBlackSecondsRemaining) % 60
            
            let currentTime = String(format: "%02i:%02i", minutes, seconds)
            self.blackTimeLabel.setTitle(String(currentTime), for: UIControl.State.normal)
            
        }
        else {
            mainTimer?.invalidate()
        }
    }
    
    // MARK:- Back Button functions
    
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
