//
//  SelectViewController.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import TinyConstraints

class SelectViewController: UIViewController {
  
  private weak var selectView: SelectView?
  
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
    
    //selectView
    let selectView = SelectView()
    selectView.delegate = self
    self.view.addSubview(selectView)
    selectView.edgesToSuperview()
    self.selectView = selectView
  }
}

//MARK: SelectViewDelegate
extension SelectViewController: SelectViewDelegate {
  func tapOk() {
    let checkViewConttoller = CheckViewController()
    self.navigationController?.pushViewController(checkViewConttoller, animated: true)
  }
  
  func tapNo() {
    let checkViewConttoller = CheckViewController()
    self.navigationController?.pushViewController(checkViewConttoller, animated: true)
  }
}
