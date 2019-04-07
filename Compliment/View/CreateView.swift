//
//  CreateView.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints

protocol CreateViewDelegate {
  func tapStart()
}

class CreateView: UIView {
  
  private weak var scrollView: ComplimentScrollView?
  private weak var contentView: UIView?
  
  private weak var stackView: UIStackView?
  
  private weak var goalTitleLabelBaseView: UIView?
  private weak var goalTitleLabel: UILabel?
  private weak var goalTitleLine: UIView?
  private weak var goalLabelBaseView: UIView?
  private weak var goalTextFiled: UITextField?
  private weak var goalLine: UIView?
  
  private weak var dateTitleLabelBaseView: UIView?
  private weak var dateTitleLabel: UILabel?
  private weak var dateTitleLine: UIView?
  private weak var dateLabelBaseView: UIView?
  private weak var dateTextFiled: UITextField?
  private weak var dateLine: UIView?
  
  private weak var rewardTitleLabelBaseView: UIView?
  private weak var rewardTitleLabel: UILabel?
  private weak var rewardTitleLine: UIView?
  private weak var rewardLabelBaseView: UIView?
  private weak var rewardTextFiled: UITextField?
  private weak var rewardLine: UIView?
  
  private weak var startViewTopLine: UIView?
  private weak var startView: UIView?
  private weak var startLabel: UILabel?
  private weak var startViewBottomAreaView: UIView?
  
  var delegate: CreateViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    //basic
    self.backgroundColor = .white
    
    //scrollView
    let scrollView = ComplimentScrollView()
    addSubview(scrollView)
    scrollView.edgesToSuperview()
    self.scrollView = scrollView
    
    //contentView
    let contentView = UIView()
    contentView.isUserInteractionEnabled = true
    contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapContentView)))
    scrollView.addSubview(contentView)
    contentView.edgesToSuperview()
    contentView.width(to: scrollView)
    self.contentView = contentView
    
    //stackView
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 20.0
    contentView.addSubview(stackView)
    stackView.topToSuperview(offset: 100.0)
    stackView.leftToSuperview(offset: 10.0)
    stackView.rightToSuperview(offset: -10.0)
    self.stackView = stackView
    
    //goalTitleLabelBaseView
    let goalTitleLabelBaseView = UIView()
    stackView.addArrangedSubview(goalTitleLabelBaseView)
    goalTitleLabelBaseView.height(35.0)
    self.goalTitleLabelBaseView = goalTitleLabelBaseView
    
    //goalTitleLabel
    let goalTitleLabel = UILabel()
    goalTitleLabel.text = "목표"
    goalTitleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
    goalTitleLabel.textColor = .black
    goalTitleLabelBaseView.addSubview(goalTitleLabel)
    goalTitleLabel.edgesToSuperview()
    self.goalTitleLabel = goalTitleLabel
    
    //goalTitleLine
    let goalTitleLine = UIView()
    goalTitleLine.backgroundColor = .black
    goalTitleLabelBaseView.addSubview(goalTitleLine)
    goalTitleLine.edgesToSuperview(excluding: .top)
    goalTitleLine.height(2.0)
    self.goalTitleLine = goalTitleLine
    
    //goalLabelBaseView
    let goalLabelBaseView = UIView()
    stackView.addArrangedSubview(goalLabelBaseView)
    goalLabelBaseView.height(30.0)
    self.goalLabelBaseView = goalLabelBaseView
    
    //goalTextFiled
    let goalTextFiled = UITextField()
    goalTextFiled.placeholder = "운동하기"
    goalTextFiled.font = UIFont.boldSystemFont(ofSize: 20.0)
    goalTextFiled.textColor = .gray
    goalTextFiled.returnKeyType = .done
    goalTextFiled.delegate = self
    goalLabelBaseView.addSubview(goalTextFiled)
    goalTextFiled.edgesToSuperview()
    self.goalTextFiled = goalTextFiled
    
    //goalLine
    let goalLine = UIView()
    goalLine.backgroundColor = .gray
    goalLabelBaseView.addSubview(goalLine)
    goalLine.edgesToSuperview(excluding: .top)
    goalLine.height(1.5)
    self.goalLine = goalLine
    
    //dateTitleLabelBaseView
    let dateTitleLabelBaseView = UIView()
    stackView.addArrangedSubview(dateTitleLabelBaseView)
    dateTitleLabelBaseView.height(35.0)
    self.dateTitleLabelBaseView = dateTitleLabelBaseView
    
    //dateTitleLabel
    let dateTitleLabel = UILabel()
    dateTitleLabel.text = "일수"
    dateTitleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
    dateTitleLabel.textColor = .black
    dateTitleLabelBaseView.addSubview(dateTitleLabel)
    dateTitleLabel.edgesToSuperview()
    self.dateTitleLabel = dateTitleLabel
    
    //dateTitleLine
    let dateTitleLine = UIView()
    dateTitleLine.backgroundColor = .black
    dateTitleLabelBaseView.addSubview(dateTitleLine)
    dateTitleLine.edgesToSuperview(excluding: .top)
    dateTitleLine.height(2.0)
    self.dateTitleLine = dateTitleLine
    
    //dateLabelBaseView
    let dateLabelBaseView = UIView()
    stackView.addArrangedSubview(dateLabelBaseView)
    dateLabelBaseView.height(30.0)
    self.dateLabelBaseView = dateLabelBaseView
    
    //dateTextFiled
    let dateTextFiled = UITextField()
    dateTextFiled.placeholder = "30"
    dateTextFiled.font = UIFont.boldSystemFont(ofSize: 20.0)
    dateTextFiled.textColor = .gray
    dateTextFiled.keyboardType = .numberPad
    dateTextFiled.returnKeyType = .done
    dateTextFiled.delegate = self
    dateLabelBaseView.addSubview(dateTextFiled)
    dateTextFiled.edgesToSuperview()
    self.dateTextFiled = dateTextFiled
    
    //dateLine
    let dateLine = UIView()
    dateLine.backgroundColor = .gray
    dateLabelBaseView.addSubview(dateLine)
    dateLine.edgesToSuperview(excluding: .top)
    dateLine.height(1.5)
    self.dateLine = dateLine
    
    //rewardTitleLabelBaseView
    let rewardTitleLabelBaseView = UIView()
    stackView.addArrangedSubview(rewardTitleLabelBaseView)
    rewardTitleLabelBaseView.height(35.0)
    self.rewardTitleLabelBaseView = rewardTitleLabelBaseView
    
    //rewardTitleLabel
    let rewardTitleLabel = UILabel()
    rewardTitleLabel.text = "보상"
    rewardTitleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
    rewardTitleLabel.textColor = .black
    rewardTitleLabelBaseView.addSubview(rewardTitleLabel)
    rewardTitleLabel.edgesToSuperview()
    self.rewardTitleLabel = rewardTitleLabel
    
    //rewardTitleLine
    let rewardTitleLine = UIView()
    rewardTitleLine.backgroundColor = .black
    rewardTitleLabelBaseView.addSubview(rewardTitleLine)
    rewardTitleLine.edgesToSuperview(excluding: .top)
    rewardTitleLine.height(2.0)
    self.dateTitleLine = dateTitleLine
    
    //rewardLabelBaseView
    let rewardLabelBaseView = UIView()
    stackView.addArrangedSubview(rewardLabelBaseView)
    rewardLabelBaseView.height(30.0)
    self.rewardLabelBaseView = rewardLabelBaseView
    
    //rewardTextFiled
    let rewardTextFiled = UITextField()
    rewardTextFiled.placeholder = "치킨치킨!!"
    rewardTextFiled.font = UIFont.boldSystemFont(ofSize: 20.0)
    rewardTextFiled.textColor = .gray
    rewardTextFiled.returnKeyType = .done
    rewardTextFiled.delegate = self
    rewardLabelBaseView.addSubview(rewardTextFiled)
    rewardTextFiled.edgesToSuperview()
    self.rewardTextFiled = rewardTextFiled
    
    //rewardLine
    let rewardLine = UIView()
    rewardLine.backgroundColor = .gray
    rewardLabelBaseView.addSubview(rewardLine)
    rewardLine.edgesToSuperview(excluding: .top)
    rewardLine.height(1.5)
    self.rewardLine = rewardLine
    
    //startView
    let startView = UIView()
    startView.backgroundColor = .yellow
    startView.isUserInteractionEnabled = true
    startView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapStart)))
    self.addSubview(startView)
    startView.topToBottom(of: contentView)
    startView.leftToSuperview()
    startView.rightToSuperview()
    startView.bottomToSuperview(usingSafeArea: true)
    startView.height(50.0)
    self.startView = startView
    
    //startViewTopLine
    let startViewTopLine = UIView()
    startViewTopLine.backgroundColor = .black
    startView.addSubview(startViewTopLine)
    startViewTopLine.edgesToSuperview(excluding: .bottom)
    startViewTopLine.height(1.5)
    self.startViewTopLine = startViewTopLine
    
    //startLabel
    let startLabel = UILabel()
    startLabel.text = "시작!!"
    startLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
    startLabel.textColor = .black
    startView.addSubview(startLabel)
    startLabel.centerInSuperview()
    self.startLabel = startLabel
    
    //startViewBottomAreaView
    let startViewBottomAreaView = UIView()
    startViewBottomAreaView.backgroundColor = .yellow
    startViewBottomAreaView.isUserInteractionEnabled = true
    startViewBottomAreaView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapStart)))
    self.addSubview(startViewBottomAreaView)
    startViewBottomAreaView.topToBottom(of: startView)
    startViewBottomAreaView.leftToSuperview()
    startViewBottomAreaView.rightToSuperview()
    startViewBottomAreaView.bottomToSuperview()
    self.startViewBottomAreaView = startViewBottomAreaView
  }
  
  @objc private func tapContentView() {
    self.endEditing(true)
  }
  
  @objc private func tapStart() {
    self.delegate?.tapStart()
  }
}

//MARK: UITextFieldDelegate
extension CreateView: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.endEditing(true)
    
    return true
  }
}
