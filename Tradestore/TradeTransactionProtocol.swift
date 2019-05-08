//
//  TradeTransactionProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public enum TradeTransactionType: String, Codable {
    case unknown = "unknown"
    case order = "order"
    case orderChange = "order_change"
    case orderCancel = "order_cancel"
    case storage = "storage"
    case retrieval = "retrieval"
}

public protocol TradeTransactionProtocol: Codable {
    var type: TradeTransactionType { get set }
    var selledBy: String { get set }
    var purchasedBy: String { get set }
    var orderReference: DocumentReference! { get set }
    var productReference: DocumentReference? { get set }
    var skuRefernece: DocumentReference! { get set }
    var stockReference: DocumentReference? { get set }
    var itemReference: DocumentReference! { get set }
}
