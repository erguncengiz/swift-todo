//
//  TaskViewController.swift
//  todo-app
//
//  Created by Ergün Yunus Cengiz on 25.03.2022.
//

import UIKit

class TaskViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    var passedTask: TodoObj!

    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        
        label.text = passedTask.header
        textView.text = passedTask.description
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        print("You need to configure delete item! - EYC")
    }

}
