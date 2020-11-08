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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    @IBAction func goButtonsPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueToTimer", sender: self)
    }

    
    
    
    
}
