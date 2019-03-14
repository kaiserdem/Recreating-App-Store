//
//  CategoryCell.swift
//  RecreatingAppStore
//
//  Created by Kaiserdem on 14.03.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let appsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor.blue
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  func setupViews() {
    backgroundColor = .green
    
    addSubview(appsCollectionView)
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": appsCollectionView]))
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": appsCollectionView]))
  }
}
