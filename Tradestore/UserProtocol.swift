//
//  UserProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public protocol UserProtocol {
    var isAvailabled: Bool { get set }
    var country: String { get set }
}
