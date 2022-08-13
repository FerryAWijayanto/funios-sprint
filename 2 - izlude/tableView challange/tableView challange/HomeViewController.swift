//
//  ViewController.swift
//  tableView challange
//
//  Created by Fahri Novaldi on 12/08/22.
//

import UIKit

class HomeViewController: UIViewController, UINavigationBarDelegate {
    
    var tasks: [Task] = [
        Task(name: "ashow", isFinished: false),
        Task(name: "ishiw", isFinished: false),
        Task(name: "kelar", isFinished: true)
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        view.backgroundColor = .blue
        setupView()
    }
    
    private func setupNavBar(){
        
        navigationItem.title = "Fahri N"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white
        
        // make navbar to notch
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .systemTeal
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            navigationController?.edgesForExtendedLayout = []
        }
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItems =  [addButton]
    }
    
    @objc private func addButtonTapped() {
        let alert = UIAlertController(title: "Tambah Task", message: "tulis nama task", preferredStyle: .alert)
        alert.addTextField()
        
        let save = UIAlertAction(title: "Simpan", style: .default) { _ in
            let t = Task(name: alert.textFields![0].text ?? " ", isFinished: false)
            self.tasks.append(t)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "batal", style: .destructive)
        alert.addAction(save)
        alert.addAction(cancel)
        
        alert.textFields?[0].placeholder = "tulis disini"
        self.present(alert, animated: true)
    }
    
    private func setupView(){
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        ])
    }
    
   
    
}

