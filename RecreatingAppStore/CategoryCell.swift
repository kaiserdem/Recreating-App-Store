//
//  CategoryCell.swift
//  RecreatingAppStore
//
//  Created by Kaiserdem on 14.03.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  private let cellId = "appCellId"

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  let nameLabel: UILabel = {
    let lb = UILabel()
    lb.text = "Best New Apps"
    lb.font = UIFont.systemFont(ofSize: 17)
    lb.translatesAutoresizingMaskIntoConstraints = false
    return lb
  }()
  
  let appsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor.clear
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
    
  }()
  
  let divideLineView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  func setupViews() {
    backgroundColor = .clear
    
    addSubview(appsCollectionView)
    addSubview(divideLineView)
    addSubview(nameLabel)
    
    appsCollectionView.dataSource = self
    appsCollectionView.delegate = self
    
    appsCollectionView.register(AppCell.self, forCellWithReuseIdentifier: cellId)
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": nameLabel]))

    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": divideLineView]))

    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": appsCollectionView]))
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["nameLabel": nameLabel,"v0": appsCollectionView, "v1": divideLineView]))
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: frame.height - 30)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
  }
}
class AppCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    let imageView: UIImageView = {
      let iv = UIImageView()
      iv.image = UIImage(named: "image_1")
      iv.contentMode = .scaleAspectFill
      iv.layer.cornerRadius = 6
      iv.layer.masksToBounds = true
      return iv
    }()
  let nameLabel: UILabel = {
    let lb = UILabel()
    lb.text = "Hello hello hello hello hello"
    lb.font = UIFont.systemFont(ofSize: 12)
    lb.numberOfLines = 2
    return lb
  }()
  let categoryLabel: UILabel = {
    let lb = UILabel()
    lb.text = "Entertaiment"
    lb.font = UIFont.systemFont(ofSize: 14)
    return lb
  }()
  let priceLabel: UILabel = {
    let lb = UILabel()
    lb.text = "$3.99"
    lb.font = UIFont.systemFont(ofSize: 12)
    lb.textColor = UIColor.darkGray
    return lb
  }()
    
  func setupViews() {
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(categoryLabel)
    addSubview(priceLabel)
    
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": imageView]))
//
//    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: ["v0": imageView]))
    
    imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
    nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 40)
    categoryLabel.frame = CGRect(x: 0, y: frame.width + 42, width: frame.width, height: 20)
    priceLabel.frame = CGRect(x: 0, y: frame.width + 56, width: frame.width, height: 20)
  }
}

