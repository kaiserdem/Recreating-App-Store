//
//  ViewController.swift
//  RecreatingAppStore
//
//  Created by Kaiserdem on 14.03.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import UIKit
                // реккомендуемые
class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  private let cellId = "cellId"
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    
    collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
  }
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
    
  }
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 230)
  }

}
