//
//  ViewController.swift
//  collectionView Challenge
//
//  Created by Fahri Novaldi on 17/08/22.
//

import UIKit

class TableViewController: UIViewController {
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemPink,
        .systemPurple,
        .systemTeal,
        .systemBrown,
        .systemGreen,
        .systemIndigo,
        .systemYellow
    ]
    
    let tableView = UITableView()
    let cellIdentifier = "TableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }

    private func setupView(){
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: self.cellIdentifier)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
}
extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let collectionVC = CollectionViewController(pallete: colors[indexPath.row])
//        present(collectionVC, animated: true)
        navigationController?.pushViewController(collectionVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
