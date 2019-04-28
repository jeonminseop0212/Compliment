//
//  SelectView.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints
import RealmSwift

protocol SelectViewDelegate {
  func tapOk()
  func tapNo()
}

class SelectView: UIView {
  
  private weak var stackView: UIStackView?
  
  private weak var titleBaseView: UIView?
  private weak var titileLabel: UILabel?
  private weak var titleDataLabel: UILabel?
  
  private weak var okBaseView: UIView?
  private weak var okLabel: UILabel?
  private weak var noBaseView: UIView?
  private weak var noLabel: UILabel?
  
  var delegate: SelectViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
    setupGoal()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    //stackView
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 10
    self.addSubview(stackView)
    stackView.centerYToSuperview()
    stackView.leftToSuperview(offset: 50.0)
    stackView.rightToSuperview(offset: -50.0)
    self.stackView = stackView
    
    //titleBaseView
    let titleBaseView = UIView()
    stackView.addArrangedSubview(titleBaseView)
    titleBaseView.height(130.0)
    self.titleBaseView = titleBaseView
    
    //titileLabel
    let titileLabel = UILabel()
    titileLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
    titileLabel.textAlignment = .center
    titleBaseView.addSubview(titileLabel)
    titileLabel.topToSuperview()
    titileLabel.leftToSuperview()
    titileLabel.rightToSuperview()
    self.titileLabel = titileLabel
    
    //titleDataLabel
    let titleDataLabel = UILabel()
    titleDataLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
    titleDataLabel.textAlignment = .center
    titleBaseView.addSubview(titleDataLabel)
    titleDataLabel.topToBottom(of: titileLabel, offset: 5.0)
    titleDataLabel.leftToSuperview()
    titleDataLabel.rightToSuperview()
    self.titleDataLabel = titleDataLabel
    
    //okBaseView
    let okBaseView = UIView()
    okBaseView.layer.cornerRadius = 5.0
    okBaseView.layer.masksToBounds = true
    okBaseView.layer.borderWidth = 3.0
    okBaseView.layer.borderColor = UIColor.black.cgColor
    okBaseView.isUserInteractionEnabled = true
    okBaseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapOk)))
    stackView.addArrangedSubview(okBaseView)
    okBaseView.height(120.0)
    self.okBaseView = okBaseView
    
    //okLabel
    let okLabel = UILabel()
    okLabel.text = "했어!v(｡･ω･｡)"
    okLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
    okLabel.textAlignment = .center
    okBaseView.addSubview(okLabel)
    okLabel.edgesToSuperview()
    self.okLabel = okLabel
    
    //noBaseView
    let noBaseView = UIView()
    noBaseView.layer.cornerRadius = 5.0
    noBaseView.layer.masksToBounds = true
    noBaseView.layer.borderWidth = 3.0
    noBaseView.layer.borderColor = UIColor.black.cgColor
    noBaseView.isUserInteractionEnabled = true
    noBaseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNo)))
    stackView.addArrangedSubview(noBaseView)
    noBaseView.height(120.0)
    self.noBaseView = noBaseView
    
    //noLabel
    let noLabel = UILabel()
    noLabel.text = "안했어ㅠㅠ"
    noLabel.font = UIFont.boldSystemFont(ofSize: 35.0)
    noLabel.textAlignment = .center
    noBaseView.addSubview(noLabel)
    noLabel.edgesToSuperview()
    self.noLabel = noLabel
  }
  
  private func setupGoal() {
    guard let titileLabel = self.titileLabel,
          let titleDataLabel = self.titleDataLabel else { return }
    
    do {
      let realm = try Realm()
      if let goal = realm.objects(Goal.self).first {
        titileLabel.text = goal.title
        if let startDate = goal.startDate, let elapsedDays = Calendar.current.dateComponents([.day], from: startDate, to: Date()).day {
          titleDataLabel.text = "\(elapsedDays + 1)일차"
        }
      }
    } catch {
      print("realm error")
    }
  }
  
  private func saveCheck(isChecked: Bool) {
    do {
      let realm = try Realm()
      let check = Check()
      check.date = Date()
      check.isChecked = isChecked
      
      try realm.write {
        realm.add(check)
      }
    } catch {
      print("realm error")
    }
  }
  
  @objc private func tapOk() {
    saveCheck(isChecked: true)
    self.delegate?.tapOk()
  }
  
  @objc private func tapNo() {
    saveCheck(isChecked: false)
    self.delegate?.tapNo()
  }
}
