//
//  OffTimeViewController.swift
//  Train_Timer
//
//  Created by Sonya Radichkova on 1/13/21.
//

import UIKit

class OffTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        BeginWorkoutButton.layer.cornerRadius=10
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var BeginWorkoutButton: UIButton!
    @IBOutlet weak var RecoveryTimeInSecLabel: UILabel!
    @IBAction func SlideToChangeRecoveryTime(_ sender: UISlider) {
        let currentValue=(Int(sender.value))*5
        if currentValue>=60{
            let min=currentValue/60
            let sec=currentValue%60
            RecoveryTimeInSecLabel.text="\(min) min. \(sec) sec."
        }else{
            RecoveryTimeInSecLabel.text="\(currentValue) sec."
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
