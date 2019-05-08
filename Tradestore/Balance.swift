//
//  Balance.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public struct Balance: Codable & Equatable {

    public var pending: [Currency: Int] = [:]

    public var available: [Currency: Int] = [:]

    public init() { }

    public init(pending: [Currency: Int], available: [Currency: Int]) {
        self.init()
        self.pending = pending
        self.available = available
    }
}
