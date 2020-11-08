//
//  TimerViewController.swift
//  Chess Clock
//
//  Created by Ben Williams on 07/11/2020.
//  Copyright © 2020 Ben Williams. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var blackTimeLabel: UIButton!
    @IBOutlet weak var whiteTimeLabel: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    var blackIsActive = false
    var whiteIsActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds long press gesture recogniser to the 'Hold to go back' button
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(backButtonLongTap))
        longGesture.minimumPressDuration = 1
        backButton.addGestureRecognizer(longGesture)
        
    }
    
    // What happens when the back button is long pressed
    @objc func backButtonLongTap(_ sender: UIGestureRecognizer){
        print("Long tap")
        if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            
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
    
    @IBAction func blackPressed(_ sender: UIButton) {
    
    var totalSecondsRemaining = (5 * 60)
    
    let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
        
        if totalSecondsRemaining > 0 {
            totalSecondsRemaining -= 1
            
            let minutes = Int(totalSecondsRemaining) / 60 % 60
            let seconds = Int(totalSecondsRemaining) % 60
            
            self.blackTimeLabel.titleLabel?.text = String(format: "%02i:%02i", minutes, seconds)
            
        }
        else {
            timer.invalidate()
        }
    }
    
    timer.fire()
    
    }
    
    @IBAction func whitePressed(_ sender: UIButton) {
        
        var totalSecondsRemaining = (5 * 60)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            
            if totalSecondsRemaining > 0 {
                totalSecondsRemaining -= 1
                
                let minutes = Int(totalSecondsRemaining) / 60 % 60
                let seconds = Int(totalSecondsRemaining) % 60
                
                self.whiteTimeLabel.titleLabel?.text = String(format: "%02i:%02i", minutes, seconds)
                
            }
            else {
                timer.invalidate()
            }
        }
        
        timer.fire()
        
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
