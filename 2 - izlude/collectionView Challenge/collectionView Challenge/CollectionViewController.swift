//
//  CollectionViewController.swift
//  collectionView Challenge
//
//  Created by Fahri Novaldi on 18/09/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let pallete: UIColor
    
    var collectionView: UICollectionView!
    let cellIdentifier = "CollectionCell"
    
    init(pallete: UIColor) {
        self.pallete = pallete
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        
        let itemWidth = view.bounds.width / 2
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}

// MARK: Datasource

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) 
        let alpha: CGFloat = 0.1 * CGFloat(indexPath.row + 1)
        cell.backgroundColor = pallete.withAlphaComponent(alpha)
        
        return cell
    }
    
    
}

// MARK: Delegate
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
