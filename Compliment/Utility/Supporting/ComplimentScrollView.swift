//
//  ComplimentScrollView.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/06.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit

class ComplimentScrollView: UIScrollView {
  
  override func scrollRectToVisible(_ rect: CGRect, animated: Bool) {
    //srollviewの上に置いたtext viewのscrollをfalseにするとtextviewのtextを変えると自動的にこのメソッドが呼ばれておかしいスクロールをしてしまうのでここを殻にしておく
  }
}
