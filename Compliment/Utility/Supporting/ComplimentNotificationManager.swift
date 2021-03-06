//
//  ComplimentNotificationManager.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit

class ComplimentNotificationManager: NSObject {
  
  //MARK: base remove
  static func remove(_ observer:Any) {
    NotificationCenter.default.removeObserver(observer)
  }
  
  //MARK: base post
  private static func post(notificationName:NSNotification.Name, object:Any?, userInfo:[AnyHashable: Any]?) {
    NotificationCenter.default.post(name: notificationName, object: object, userInfo: userInfo)
  }
  private static func post(name:String, object:Any?, userInfo:[AnyHashable: Any]? = nil) {
    self.post(notificationName: NSNotification.Name(name), object: object, userInfo: userInfo)
  }
  
  //MARK: base receive
  private static func receive(notificationName:NSNotification.Name, observer:Any, selector:Selector) {
    NotificationCenter.default.addObserver(observer, selector: selector, name: notificationName, object: nil)
  }
  private static func receive(name:String, observer:Any, selector:Selector) {
    self.receive(notificationName:NSNotification.Name(name), observer:observer, selector:selector)
  }
  
  //MARK: Keyboard
  static func receive(keyboardDidChangeFrame observer:Any, selector:Selector) {
    let name = UIResponder.keyboardDidChangeFrameNotification
    self.receive(notificationName: name, observer: observer, selector: selector)
  }
  static func receive(keyboardDidHide observer:Any, selector:Selector) {
    let name = UIResponder.keyboardDidHideNotification
    self.receive(notificationName: name, observer: observer, selector: selector)
  }
  static func receive(keyboardWillChangeFrame observer:Any, selector:Selector) {
    let name = UIResponder.keyboardWillChangeFrameNotification
    self.receive(notificationName: name, observer: observer, selector: selector)
  }
  static func receive(keyboardWillHide observer:Any, selector:Selector) {
    let name = UIResponder.keyboardWillHideNotification
    self.receive(notificationName: name, observer: observer, selector: selector)
  }
  static func receive(keyboardWillShow observer:Any, selector:Selector) {
    let name = UIResponder.keyboardWillShowNotification
    self.receive(notificationName: name, observer: observer, selector: selector)
  }
}
