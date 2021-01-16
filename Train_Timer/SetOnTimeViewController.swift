//
//  SetOnTimeViewController.swift
//  Train_Timer
//
//  Created by Sonya Radichkova on 1/12/21.
//

import UIKit

class ArrayCreator{
    static func formArrays(maxNumber: Int, unit: String) ->[String]{
            var arr:[String]=[]
            for num in 0...maxNumber{
                let int_to_string=String(num)
                arr[num]=int_to_string+" "+unit
            }
            return arr
        }
}

class SetOnTimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
    var selectedMins: String? //left dial for minutes
    var minuteList=["0 min", "1 min", "2 min", "3 min", "4 min", "5 min"]
    var selectedSeconds: String? //right dial for seconds
//    var arrCreate=ArrayCreator()
    var secondsList=ArrayCreator.formArrays(maxNumber: 59, unit: "sec")
    //function currently takes in a string array; figure out how to make this more generic?
    
//    init() {
//        secondsList=formArrays(maxNumber: 59, unit: "sec")
//    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
