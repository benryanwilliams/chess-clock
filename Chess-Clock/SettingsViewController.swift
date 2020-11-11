//
//  SettingsViewController.swift
//  Chess Clock
//
//  Created by Ben Williams on 07/11/2020.
//  Copyright © 2020 Ben Williams. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var incrementPicker: UIPickerView!
    
    // Declare arrays for the timePicker and incrementPicker data
    var times = [1, 2, 3, 5, 10, 15, 30]
    var increments = [0, 1, 2, 3, 5, 10, 20]
    
    // Hide navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        incrementPicker.delegate = self
        incrementPicker.delegate = self
        
    }
    
    // Pass time and increment selected to TimerViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTimer" {
            let timerVC = segue.destination as! TimerViewController
            
            timerVC.timeInMinutes = times[timePicker.selectedRow(inComponent: 0)]
            timerVC.incrementInSeconds = increments[incrementPicker.selectedRow(inComponent: 0)] * 1000
        }
    }
    
    // Perform segue to TimerViewController when either go button is pressed
    @IBAction func goButtonsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "segueToTimer", sender: self)
    }
}

// MARK:- PickerView Data Source Methods

extension SettingsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == timePicker {
            return times.count
        }
        if pickerView == incrementPicker {
            return increments.count
        }
        else {
            fatalError("number of rows for pickerview could not be ascertained")
        }
    }
}


// MARK:- PickerView Delegate Methods

extension SettingsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if pickerView == timePicker {
            let pickerLabel = UILabel()
            pickerLabel.textColor = UIColor.white
            pickerLabel.text = String("\(times[row]) min")
            pickerLabel.font = UIFont.boldSystemFont(ofSize: 45)
            pickerLabel.textAlignment = NSTextAlignment.center
            return pickerLabel
        }
        
        if pickerView == incrementPicker {
            let pickerLabel = UILabel()
            pickerLabel.textColor = UIColor.black
            pickerLabel.text = String("\(increments[row]) sec")
            pickerLabel.font = UIFont.boldSystemFont(ofSize: 45)
            pickerLabel.textAlignment = NSTextAlignment.center
            return pickerLabel
        }
        
        return pickerView
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 45
    }
}
