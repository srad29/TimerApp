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
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
        Num_Sets_Text_Field.text="5"
        
    }
    //invalidate timer when you're done with it
    
    @IBAction func DecreaseSetButton(_ sender: UIButton) {
    }
    @IBOutlet weak var Num_Sets_Text_Field: UITextField!
    
    
    @IBAction func Decrease_Set_Amount(_ sender: UIButton) {
        var num:Int?=Int(Num_Sets_Text_Field.text!) //shouldn't throw exception since we've set to 5 as default
        if(num!>0){
            num!-=1
        }else{
            num=0
        }
        Num_Sets_Text_Field.text=String(num!)

    }
    @IBAction func Increase_Set_Amount(_ sender: UIButton) {
        var num:Int?=Int(Num_Sets_Text_Field.text!) //force unwrap
        num!+=1 //increase
        Num_Sets_Text_Field.text=String(num!)
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

