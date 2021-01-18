//
//  ViewController.swift
//  Train_Timer
//
//  Created by Sonya Radichkova on 1/7/21.
//

import UIKit
var default_set_amount=5 //user should be able to change this - will fix later

class ViewController: UIViewController {
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DecreaseSetButton.layer.cornerRadius=10
        IncreaseSetButton.layer.cornerRadius=10
        ContinueToExerciseTimeButton.layer.cornerRadius=10
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
        Num_Sets_Text_Field.text="5"
        
    }
    //invalidate timer when you're done with it
    
    @IBOutlet weak var DecreaseSetButton: UIButton!
    @IBOutlet weak var IncreaseSetButton: UIButton!
    @IBOutlet weak var ContinueToExerciseTimeButton: UIButton!
    
    
    @IBOutlet weak var Num_Sets_Text_Field: UITextField!
    
    
    @IBAction func Decrease_Set_Amount(_ sender: UIButton) {
        var num:Int?=Int(Num_Sets_Text_Field.text!) //shouldn't throw exception since we've set to 5 as default
        
        //enables/disables continue button if set number is 0.
       
        if(num!>0){
            num!-=1
            if num==0{
                ContinueToExerciseTimeButton.isUserInteractionEnabled=false//.isEnabled=false
                ContinueToExerciseTimeButton.backgroundColor=UIColor.gray
            }else{
                ContinueToExerciseTimeButton.isUserInteractionEnabled=true//.isEnabled=true
                ContinueToExerciseTimeButton.backgroundColor=UIColor.systemGreen
            }
        }else{
            num=0
            ContinueToExerciseTimeButton.isUserInteractionEnabled=false//.isEnabled=false
            ContinueToExerciseTimeButton.backgroundColor=UIColor.gray
        }
        Num_Sets_Text_Field.text=String(num!)

    }
    @IBAction func Increase_Set_Amount(_ sender: UIButton) {
        var num:Int?=Int(Num_Sets_Text_Field.text!) //force unwrap
        num!+=1 //increase
        Num_Sets_Text_Field.text=String(num!)
        ContinueToExerciseTimeButton.isUserInteractionEnabled=true
        ContinueToExerciseTimeButton.backgroundColor=UIColor.systemGreen

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
    
    @objc func fire()
            {
                print("FIRE!!!")
            }

}

