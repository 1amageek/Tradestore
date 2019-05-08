//
//  BalanceTransactionProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public enum BalanceTransactionType: String, Codable {
    case unknown = "unknown"
    case payment = "payment"
    case paymentRefund = "payment_refund"
    case transfer = "transfer"
    case transferRefund = "transfer_refund"
    case payout = "payout"
    case payoutCancel = "payout_cancel"
}

public protocol BalanceTransactionProtocol {
    associatedtype TransactionResultType: TransactionResultProtocol
    var type: BalanceTransactionType { get set }
    var currency: Currency { get set }
    var amount: Int { get set }
    var from: String { get set }
    var to: String { get set }
    var orderReference: DocumentReference? { get set }
    var transferReference: DocumentReference? { get set }
    var payoutReference: DocumentReference? { get set }
    var transactionResults: [TransactionResultType] { get set }
}
