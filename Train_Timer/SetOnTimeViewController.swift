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
    
    
    @IBOutlet weak var MinutePickerView: UIPickerView!
    @IBOutlet weak var SecondsPickerView: UIPickerView!
    
    @IBOutlet weak var minutesOfExerciseLabel: UILabel!
    @IBOutlet weak var secondsOfExerciseLabel: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            print(secondsList)
        
        MinutePickerView.delegate=self
        MinutePickerView.dataSource=self
        SecondsPickerView.delegate=self
        MinutePickerView.dataSource=self
            // Do any additional setup after loading the view.
        }
    var selectedMins: String? //left dial for minutes
    var minuteList=["0 min", "1 min", "2 min", "3 min", "4 min", "5 min"]
    var selectedSeconds: String? //right dial for seconds
//    var arrCreate=ArrayCreator()
    var secondsList=ArrayCreator.formArrays(maxNumber: 59, unit: "sec")

    
    
    
    func numberOfComponents(in minutePickerView: UIPickerView) -> Int {
        return 1
    }
    func minutePickerView(_ minutePickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return minuteList.count
    }
    func minutePickerView(_ minutePickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return minuteList[row]
    }
    func minutePickerView(_ minutePickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        minutesOfExerciseLabel.text=minuteList[row] //create label
    }
    func numberOfComponents(in secondsPickerView: UIPickerView) -> Int {
        return 1
    }
    func secondsPickerView(_ secondsPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return secondsList.count
    }
    func secondsPickerView(_ secondsPickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return secondsList[row]
    }
    func secondsPickerView(_ secondsPickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        secondsOfExerciseLabel.text=secondsList[row]
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
    
    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        if pickerView == topPickerView
//            {
//                return 1
//            }
//            else
//            {
//                return 1
//            }
//    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return minuteList.count // number of dropdown items
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return minuteList[row] // dropdown item
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    selectedMins = minuteList[row] // selected item
    textFiled.text = selectedMins
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
