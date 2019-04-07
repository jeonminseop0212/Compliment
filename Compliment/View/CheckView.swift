//
//  CheckView.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit

class CheckView: UIView {
  
  private weak var titleLabel: UILabel?
  
  private weak var collectionView: UICollectionView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    //titleLabel
    let titleLabel = UILabel()
    titleLabel.text = "운동하기"
    titleLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
    self.addSubview(titleLabel)
    titleLabel.topToSuperview(offset: 100.0)
    titleLabel.centerXToSuperview()
    self.titleLabel = titleLabel
    
    //collectionView
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical
    flowLayout.minimumLineSpacing = 8
    flowLayout.minimumInteritemSpacing = 8
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    let id = NSStringFromClass(CheckCollectionViewCell.self)
    collectionView.register(CheckCollectionViewCell.self, forCellWithReuseIdentifier: id)
    collectionView.backgroundColor = .white
    collectionView.showsVerticalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self
    addSubview(collectionView)
    collectionView.topToBottom(of: titleLabel, offset: 50.0)
    collectionView.leftToSuperview(offset: 20.0)
    collectionView.rightToSuperview(offset: -20.0)
    collectionView.bottomToSuperview(offset: -100.0)
    self.collectionView = collectionView
  }
}

//MAKR: UICollectionViewDataSource
extension CheckView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let id = NSStringFromClass(CheckCollectionViewCell.self)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! CheckCollectionViewCell
    
    cell.numberLabel?.text = String(indexPath.item + 1)
    
    return cell
  }
}

//MARK: UICollectionViewDelegateFlowLayout
extension CheckView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let size = CGSize(width: (UIScreen.main.bounds.width - 40 - 32) / 5, height: (UIScreen.main.bounds.width - 40 - 32) / 5)
    
    return size
  }
}
