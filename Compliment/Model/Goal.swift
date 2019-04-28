//
//  Goal.swift
//  Compliment
//
//  Created by jeonminseop on 2019/04/07.
//  Copyright © 2019 jeonminseop. All rights reserved.
//

import UIKit
import RealmSwift

class Goal: Object {
  @objc dynamic var title: String = ""
  @objc dynamic var date: Int = 0
  @objc dynamic var reward: String = ""
  @objc dynamic var startDate: Date?
}
