//
//  EnrtyViewController.swift
//  todo-app
//
//  Created by Ergün Yunus Cengiz on 25.03.2022.
//

import UIKit
import iOSDropDown

class EntryViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!

    @IBOutlet weak var dropDown: DropDown!
    
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textView.delegate = self
        
        dropDown.optionArray = ["Progress", "Done", "Missed"]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        return true
    }
    
    @objc func saveTask(){
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        guard let textViewText = textView.text, !textViewText.isEmpty else{
            return
        }
        
        let selectedState = self.dropDown.optionArray[dropDown.selectedIndex ?? 0]
        print("\(selectedState) - EYC")
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        let newCount = count + 1
        
        let taskObject = TodoObj(id: "task_\(newCount)", header: text, description: textViewText, state: selectedState, date: Date.now)
        
        UserDefaults().set(newCount, forKey: "count")
        do {
            try UserDefaults().setObject(taskObject, forKey: taskObject.id)
        } catch {
            print(error.localizedDescription)
        }
        
        update?()
        navigationController?.popViewController(animated: true)
    }

}
