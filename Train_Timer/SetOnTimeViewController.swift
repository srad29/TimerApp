//
//  SetOnTimeViewController.swift
//  Train_Timer
//
//  Created by Sonya Radichkova on 1/12/21.
//

import UIKit

class ArrayCreator{
    static func formArrays(maxNumber: Int, unit: String) ->[String]{
            var arr=[String]()
            for num in 0...maxNumber{
                let int_to_string=String(num)
                arr.append("\(int_to_string) \(unit)")
            }
            return arr
        }
}
//class ContinueButton:UILabel{
//    override var text: String? {
//            didSet {
//                if let text = text {
//                    println("Text changed.")
//                } else {
//                    println("Text not changed.")
//                }
//            }
//        }
//}
class SetOnTimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var ContinueToRecoveryTimeButton: UIButton!
    @IBOutlet weak var BackToSetAmountButton: UIButton!
    
    
    @IBOutlet weak var MinutePickerView: UIPickerView!
    @IBOutlet weak var SecondsPickerView: UIPickerView!
    
    @IBOutlet weak var minutesOfExerciseLabel: UILabel!
    @IBOutlet weak var secondsOfExerciseLabel: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print(secondsList)
        ContinueToRecoveryTimeButton.layer.cornerRadius = 10
        BackToSetAmountButton.layer.cornerRadius = 10
        MinutePickerView.delegate=self
        MinutePickerView.dataSource=self
        SecondsPickerView.delegate=self
        MinutePickerView.dataSource=self
        //disables continue button if times are 00:00
        if (minutesOfExerciseLabel.text=="00" && secondsOfExerciseLabel.text=="00")||(minutesOfExerciseLabel.text==minuteList[0] && secondsOfExerciseLabel.text==secondsList[0]){
            ContinueToRecoveryTimeButton.isUserInteractionEnabled=false//.isEnabled=false
            ContinueToRecoveryTimeButton.backgroundColor=UIColor.gray
        }else{
            ContinueToRecoveryTimeButton.isUserInteractionEnabled=true//.isEnabled=true
            ContinueToRecoveryTimeButton.backgroundColor=UIColor.systemGreen
        }
            // Do any additional setup after loading the view.
        }
    var selectedMins: String? //left dial for minutes
    var minuteList=["0 min", "1 min", "2 min", "3 min", "4 min", "5 min"]
    var selectedSeconds: String? //right dial for seconds
//    var arrCreate=ArrayCreator()
    var secondsList=ArrayCreator.formArrays(maxNumber: 59, unit: "sec")

    
   
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView==MinutePickerView {
            return 1
        }else{
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView==MinutePickerView{
            return minuteList.count
        }else{
            return secondsList.count
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView==MinutePickerView{
            return minuteList[row]
        }else{
            return secondsList[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView==MinutePickerView{
            minutesOfExerciseLabel.text=minuteList[row] //create label
            if row==0 && secondsOfExerciseLabel.text==secondsList[0]{
                //disables continue button if times are 00:00
                    ContinueToRecoveryTimeButton.isUserInteractionEnabled=false//.isEnabled=false
                    ContinueToRecoveryTimeButton.backgroundColor=UIColor.gray
               
            } else{
                ContinueToRecoveryTimeButton.isUserInteractionEnabled=true//.isEnabled=true
                ContinueToRecoveryTimeButton.backgroundColor=UIColor.systemGreen
            }
        }else{
            secondsOfExerciseLabel.text=secondsList[row]
            //disables continue button if times are 00:00
            if (minutesOfExerciseLabel.text==minuteList[0] && secondsOfExerciseLabel.text==secondsList[0]){
                ContinueToRecoveryTimeButton.isUserInteractionEnabled=false//.isEnabled=false
                ContinueToRecoveryTimeButton.backgroundColor=UIColor.gray
            }else{
                ContinueToRecoveryTimeButton.isUserInteractionEnabled=true//.isEnabled=true
                ContinueToRecoveryTimeButton.backgroundColor=UIColor.systemGreen
            }
        }
    }
    
    func createPickerView(){
        let pickerView = UIPickerView()
               pickerView.delegate = self
//               textField.inputView = pickerView
    }
    func dismissPickerView() {
       let toolBar = UIToolbar()
       toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
       toolBar.setItems([button], animated: true)
       toolBar.isUserInteractionEnabled = true
//       textFiled.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
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
