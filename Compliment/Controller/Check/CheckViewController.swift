//
//  CheckViewController.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints

class CheckViewController: UIViewController {
  
  private weak var checkView: CheckView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }
  
  private func setup() {
    //basic
    ComplimentOrientation.lockOrientation(.portrait)
    self.view.backgroundColor = .white
    self.navigationController?.setNavigationBarHidden(true, animated: false)
    self.navigationController?.navigationBar.isTranslucent = false
    
    //checkView
    let checkView = CheckView()
    self.view.addSubview(checkView)
    checkView.edgesToSuperview()
    self.checkView = checkView
  }
}
