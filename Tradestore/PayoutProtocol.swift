//
//  PayoutProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public enum PayoutStatus: String, Codable {

    case none = "none"

    case requested = "requested"

    case rejected = "rejected"

    case completed = "completed"

    case cancelled = "cancelled"
}

public protocol PayoutProtocol {
    associatedtype TransactionResultType: TransactionResultProtocol
    var currency: Currency { get set }
    var amount: Int { get set }
    var account: String { get set }
    var status: PayoutStatus { get set }
    var transactionResults: [TransactionResultType] { get set }
    var isCancelled: Bool { get set }
}
