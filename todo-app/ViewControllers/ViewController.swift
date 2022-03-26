//
//  ViewController.swift
//  todo-app
//
//  Created by Ergün Yunus Cengiz on 25.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks: [TodoObj] = []
    
    @IBOutlet var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.dataSource = self
        tableView?.delegate = self
        self.title = "ToDo App"
        
        // User Defaults region
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "count")
        }
        
        updateTasks()
    }
    
    func updateTasks(){
        tasks.removeAll()
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        
        for taskIndex in 0..<count {
            do {
                if let task = try UserDefaults().getObject(forKey: "task_\(taskIndex + 1)", castTo: TodoObj?.self)
                    {
                    tasks.append(task)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        tableView?.reloadData()
    }
    
    @IBAction func addTask(){
        let vc = storyboard?.instantiateViewController(identifier: "entryVC") as! EntryViewController
        vc.title = "Let's add Task!"
        vc.update = {
            self.updateTasks()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        let vc = storyboard?.instantiateViewController(identifier: "taskVC") as! TaskViewController
        vc.title = "Task Details"
        vc.passedTask = tasks[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoTVC
        cell.labelOfTask.text = tasks[indexPath.row].header
        cell.iconOfTask.image = tasks[indexPath.row].state == "Progress" ? UIImage(systemName: "deskclock.fill") : tasks[indexPath.row].state == "Done" ? UIImage(systemName: "checkmark.seal.fill") : UIImage(systemName: "clear.fill")
        cell.iconOfTask.tintColor = tasks[indexPath.row].state == "Progress" ? UIColor.systemOrange : tasks[indexPath.row].state == "Done" ? UIColor.green : UIColor.red
        return cell
    }
}

