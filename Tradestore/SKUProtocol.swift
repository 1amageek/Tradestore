//
//  SKUProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public enum StockType: String, Codable, Equatable {
    case finite     = "finite"
    case bucket     = "bucket"
    case infinite   = "infinite"
}

public enum StockValue: String, Codable, Equatable {
    case inStock    = "in_stock"
    case limited    = "limited"
    case outOfStock = "out_of_stock"
}

public struct Inventory: Codable, Equatable {

    public var type: StockType
    public var value: StockValue?
    public var quantity: Int = 0

    public init(type: StockType, value: StockValue? = nil, quantity: Int) {
        self.type = type
        self.value = value
        self.quantity = quantity
    }

    public init(type: StockType, value: StockValue) {
        self.type = type
        self.value = value
    }
}


public protocol StockProtocol {
    var isAvailabled: Bool { get set }
    var orderReference: DocumentReference? { get set }
    var itemReference: DocumentReference? { get set }
}

public protocol SKUProtocol {
    var selledBy: String { get set }
    var createdBy: String { get set }
    var currency: Currency { get set }
    var productReference: DocumentReference? { get set }
    var amount: Int { get set }
    var inventory: Inventory { get set }
    var isAvailabled: Bool { get set }
    var numberOfFetch: Int { get set }
}
