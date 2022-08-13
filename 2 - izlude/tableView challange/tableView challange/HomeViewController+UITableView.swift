//
//  HomeViewController+UITableView.swift
//  tableView challange
//
//  Created by Fahri Novaldi on 13/08/22.
//

import UIKit


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let n: Int
        
        switch section {
        case 0: n = tasks.filter { task in
            return task.isFinished == false
        }.count
        case 1: n = tasks.filter { task in
            return task.isFinished == true
        }.count
        default:
            n = 0
        }
        
        return n
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let tempArr: [Task]
        
        switch indexPath.section {
        case 0 : tempArr = tasks.filter { task in
                    return task.isFinished == false
                }
        case 1 : tempArr = tasks.filter { task in
                    return task.isFinished == true
                }
        default:
            tempArr = []
        }
        
        
        content.text = tempArr[indexPath.row].name
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0 : return "In-Progress"
            case 1 : return "Done"
            default: return "x"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let button = UIContextualAction(style: .destructive, title: "Done") { [self] _, _, _ in
            tasks[indexPath.row].isFinished = true
            tableView.reloadData()
        }
        button.image = UIImage(systemName: "checkmark.circle")
        button.backgroundColor = .systemGreen
        
        let leadingAction = UISwipeActionsConfiguration(actions: [button])
        
        return leadingAction
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "remove") { _, _, _ in
            self.tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        delete.image = UIImage(systemName: "trash.circle")
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            
            let alert = UIAlertController(title: "Edit Task", message: "edit nama task", preferredStyle: .alert)
            alert.addTextField()
            
            let save = UIAlertAction(title: "Simpan", style: .default) { _ in
                self.tasks[indexPath.row].name = alert.textFields?[0].text ?? " "
                self.tableView.reloadData()
            }
            
            let cancel = UIAlertAction(title: "batal", style: .destructive)
            alert.addAction(save)
            alert.addAction(cancel)
            
            alert.textFields?[0].placeholder = self.tasks[indexPath.row].name
            self.present(alert, animated: true)
        }
        edit.image = UIImage(systemName: "pencil.circle")
        edit.backgroundColor = .systemTeal
        
        let trailingAction = UISwipeActionsConfiguration(actions: [delete, edit])
        return trailingAction
    }
}

