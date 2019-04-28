//
//  CheckView.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import RealmSwift

class CheckView: UIView {
  
  private weak var titleLabel: UILabel?
  
  private weak var collectionView: UICollectionView?
  
  private var goal: Goal?
  private var checkList = [Check]()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
    setupData()
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
  
  private func setupData() {
    do {
      let realm = try Realm()
      if let goal = realm.objects(Goal.self).first {
        self.goal = goal
        
        for i in 0 ..< goal.date {
          if let startDate = goal.startDate {
            let date = Calendar.current.date(byAdding: .day, value: i, to: startDate)
            
            let check = Check()
            check.date = date
            check.isChecked = false
            
            checkList.append(check)
          }
        }
      }
    } catch {
      print("realm error")
    }
  }
}

//MAKR: UICollectionViewDataSource
extension CheckView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return checkList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let id = NSStringFromClass(CheckCollectionViewCell.self)
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! CheckCollectionViewCell
    
    cell.numberLabel?.text = String(format: "%0\(String(checkList.count).count)d", indexPath.item + 1)
    cell.check = checkList[indexPath.row]
    
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
