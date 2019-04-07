//
//  CheckCollectionViewCell.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints

class CheckCollectionViewCell: UICollectionViewCell {
  
  private weak var baseView: UIView?
  weak var numberLabel: UILabel?
  
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
  }
}
