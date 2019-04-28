//
//  ViewController.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints

class CreateViewController: UIViewController {

  private var createViewBottomConstraint: Constraint?
  private weak var createView: CreateView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    setupNotifications()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    removeNotifications()
  }
  
  private func setup() {
    //basic
    ComplimentOrientation.lockOrientation(.portrait)
    self.view.backgroundColor = .white
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    self.navigationController?.navigationBar.isTranslucent = false
    
    //createView
    let createView = CreateView()
    createView.delegate = self
    self.view.addSubview(createView)
    createView.edgesToSuperview(excluding: .bottom)
    createViewBottomConstraint = createView.bottomToSuperview()
    self.createView = createView
  }
  
  private func setupNotifications() {
    removeNotifications()
    ComplimentNotificationManager.receive(keyboardWillChangeFrame: self, selector: #selector(keyboardWillChangeFrame))
    ComplimentNotificationManager.receive(keyboardWillHide: self, selector: #selector(keyboardWillHide))
  }
  
  private func removeNotifications() {
    ComplimentNotificationManager.remove(self)
  }
  
  @objc private func keyboardWillChangeFrame(_ notification: Notification) {
    guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
          let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
          let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
          let createViewBottomConstraint = self.createViewBottomConstraint else { return }
    
    let h = keyboardFrame.height
    
    createViewBottomConstraint.constant = -h
    
    UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
      self.view.layoutIfNeeded()
    })
  }
  
  @objc private func keyboardWillHide(_ notification: Notification) {
    guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval,
          let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt,
          let createViewBottomConstraint = self.createViewBottomConstraint else { return }
    
    createViewBottomConstraint.constant = 0
    
    UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(rawValue: curve), animations: {
      self.view.layoutIfNeeded()
    })
  }
}

//MARK: CreateViewDelegate
extension CreateViewController: CreateViewDelegate {
  func tapStart() {
    let selectViewController = SelectViewController()
    self.navigationController?.pushViewController(selectViewController, animated: true)
  }
}

