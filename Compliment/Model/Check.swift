//
//  CheckList.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/07.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import RealmSwift

class Check: Object {
  @objc dynamic var date: Date?
  @objc dynamic var isChecked: Bool = false
}
