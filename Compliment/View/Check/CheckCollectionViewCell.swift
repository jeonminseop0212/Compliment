//
//  CheckCollectionViewCell.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints
import RealmSwift

class CheckCollectionViewCell: UICollectionViewCell {
  
  private weak var baseView: UIView?
  weak var numberLabel: UILabel?
  private weak var redCrossImageView: UIImageView?
  
  var check: Check? {
    didSet {
      setupData()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    //baseView
    let baseView = UIView()
    baseView.layer.cornerRadius = 5.0
    baseView.layer.masksToBounds = true
    baseView.layer.borderColor = UIColor.gray.cgColor
    baseView.layer.borderWidth = 1.0
    baseView.backgroundColor = .white
    self.addSubview(baseView)
    baseView.edgesToSuperview()
    self.baseView = baseView
    
    //numberLabel
    let numberLabel = UILabel()
    numberLabel.textColor = .gray
    numberLabel.font = UIFont.systemFont(ofSize: 25.0)
    numberLabel.textAlignment = .center
    baseView.addSubview(numberLabel)
    numberLabel.edgesToSuperview()
    self.numberLabel = numberLabel
    
    //redCrossImageView
    let redCrossImageView = UIImageView()
    redCrossImageView.image = UIImage(named: "redCross")
    redCrossImageView.isHidden = true
    baseView.addSubview(redCrossImageView)
    redCrossImageView.edgesToSuperview()
    self.redCrossImageView = redCrossImageView
  }
  
  private func setupData() {
    guard let baseView = self.baseView,
          let redCrossImageView = self.redCrossImageView else { return }
    
    do {
      let realm = try Realm()
      
      let checkListObject = realm.objects(Check.self)
      for checkList in checkListObject {
        guard let clDate = checkList.date,
              let check = check,
              let cDate = check.date else { return }
        
        let checkListDate = ComplimentFunction.shared.getStringDate(date: clDate)
        let checkDate = ComplimentFunction.shared.getStringDate(date: cDate)
        
        if Date() > cDate {
          if checkListDate == checkDate {
            baseView.backgroundColor = .yellow
            redCrossImageView.isHidden = true
          } else {
            baseView.backgroundColor = .white
            redCrossImageView.isHidden = false
          }
        }
      }
    } catch {
      print("realm error")
    }
  }
}
