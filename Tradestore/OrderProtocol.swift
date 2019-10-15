//
//  OrderProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public enum OrderItemType: String, Codable, Equatable {
    case sku        = "sku"
    case tax        = "tax"
    case shipping   = "shipping"
    case discount   = "discount"
}

public enum OrderItemStatus: String, Codable, Equatable  {
    case none = "none"
    case ordered = "ordered"
    case changed = "changed"
    case canceled = "canceld"
}

public enum OrderTransferStatus: String, Codable, Equatable {
    case none = "none"
    case rejected = "rejected"
    case transferred = "transferred"
    case cancelled = "cancelled"
    case transferFailure = "failure"
    case cancelFailure = "cancel_failure"
}

public enum OrderPaymentStatus: String, Codable, Equatable {
    case none = "none"
    case rejected = "rejected"
    case authorized = "authorized"
    case paid = "paid"
    case cancelled = "cancelled"
    case paymentFailure = "failure"
    case cancelFailure = "cancel_failure"
}

public protocol OrderItemProtocol {
    var purchasedBy: String { get set }
    var createdBy: String { get set }
    var selledBy: String { get set }
    var type: OrderItemType { get set }
    var productReference: DocumentReference? { get set }
    var skuReference: DocumentReference? { get set }
    var quantity: Int { get set }
    var currency: Currency { get set }
    var amount: Int { get set }
    var status: OrderItemStatus { get set }
}

public protocol OrderProtocol {
    associatedtype AddressType: AddressProtocol
    associatedtype OrderItemType: OrderItemProtocol
    associatedtype TransactionResultType: TransactionResultProtocol
    var parentID: String? { get set }
    var purchasedBy: String { get set }
    var selledBy: String { get set }
    var shippingTo: AddressType? { get set }
    var transferredTo: [DocumentReference] { get set }
    var paidAt: Timestamp? { get set }
    var cancelableDate: Timestamp? { get set }
    var expirationDate: Timestamp? { get set }
    var currency: Currency { get set }
    var amount: Int { get set }
    var items: [OrderItemType] { get set }
    var paymentStatus: OrderPaymentStatus { get set }
    var transferStatus: OrderTransferStatus { get set }
    var transactionResults: [TransactionResultType] { get set }
    var isCancelled: Bool { get set }
}
