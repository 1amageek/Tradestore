//
//  Tradable.swift
//  Tradable
//
//  Created by 1amageek on 2018/02/25.
//  Copyright © 2018年 Stamp Inc. All rights reserved.
//

import FirebaseFirestore
import Ballcap

// MARK: - User

public protocol UserProtocol {
    var isAvailabled: Bool { get set }
    var country: String { get set }
}

public protocol AddressProtocol {

}

public protocol TransactionResultProtocol {

}

// MARK: - Account

public struct Balance: Codable & Equatable {

    public var pending: [String: Int] = [:]

    public var available: [String: Int] = [:]
}

public protocol AccountProtocol {
    var country: String { get set }
    var isRejected: Bool { get set }
    var isSigned: Bool { get set }
    var balance: Balance { get set }
}

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

// MARK: - TradeTransaction

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
    var order: String { get set }
    var product: DocumentReference? { get set }
    var sku: String { get set }
    var inventoryStock: String? { get set }
    var item: DocumentReference? { get set }
}

// MARK: - BalanceTransaction

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
    var order: String { get set }
    var transfer: String { get set }
    var payout: String { get set }
    var transactionResults: [TransactionResultType] { get set }
}

// MARK: - Product

public protocol ProductProtocol {
    var name: String { get set }
    var caption: String { get set }
    var selledBy: String { get set }
    var createdBy: String { get set }
    var isAvailabled: Bool { get set }
}

public enum StockType: String, Codable {
    case finite     = "finite"
    case bucket     = "bucket"
    case infinite   = "infinite"
}

public enum StockValue: String, Codable {
    case inStock    = "in_stock"
    case limited    = "limited"
    case outOfStock = "out_of_stock"
}

public struct Inventory: Codable & Equatable {

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

// MARK: - SKU

public protocol InventoryStockProtocol {
    var isAvailabled: Bool { get set }
    var SKU: String { get set }
}

public protocol SKUProtocol {
    var selledBy: String { get set }
    var createdBy: String { get set }
    var currency: Currency { get set }
    var product: DocumentReference? { get set }
    var amount: Int { get set }
    var unitSales: Int { get set }
    var inventory: Inventory { get set }
    var isPublished: Bool { get set }
    var isAvailabled: Bool { get set }
    var numberOfFetch: Int { get set }
}

// MARK: - Order

public enum OrderItemType: String, Codable {
    case sku        = "sku"
    case tax        = "tax"
    case shipping   = "shipping"
    case discount   = "discount"
}

public enum OrderItemStatus: String, Codable  {
    case none = "none"
    case ordered = "ordered"
    case changed = "changed"
    case canceled = "canceld"
}

public enum OrderTransferStatus: String, Codable {
    case none = "none"
    case rejected = "rejected"
    case transferred = "transferred"
    case cancelled = "cancelled"
    case transferFailure = "failure"
    case cancelFailure = "cancel_failure"
}

public enum OrderPaymentStatus: String, Codable {
    case none = "none"
    case rejected = "rejected"
    case authorized = "authorized"
    case paid = "paid"
    case cancelled = "cancelled"
    case paymentFailure = "failure"
    case cancelFailure = "cancel_failure"
}

public protocol OrderItemProtocol {
    var name: String? { get set }
    var thumbnailImage: File? { get set }
    var order: String { get set }
    var purchasedBy: String { get set }
    var createdBy: String { get set }
    var selledBy: String { get set }
    var type: OrderItemType { get set }
    var product: DocumentReference? { get set }
    var sku: String { get set }
    var quantity: Int { get set }
    var currency: Currency { get set }
    var amount: Int { get set }
    var status: OrderItemStatus { get set }
}

public protocol OrderProtocol {
    associatedtype AddressType: AddressProtocol
    associatedtype OrderItemType: OrderItemProtocol
    associatedtype TransactionResultType: TransactionResultProtocol
    var title: String? { get set }
    var assets: [File] { get set }
    var parentID: String? { get set }
    var purchasedBy: String { get set }
    var selledBy: String { get set }
    var shippingTo: AddressType? { get set }
    var transferredTo: Set<String> { get set }
    var paidAt: Timestamp? { get set }
    var expirationDate: Timestamp { get set }
    var currency: Currency { get set }
    var amount: Int { get set }
    var items: [OrderItemType] { get set }
    var paymentStatus: OrderPaymentStatus { get set }
    var transferStatus: OrderTransferStatus { get set }
    var transactionResults: [TransactionResultType] { get set }
    var isCancelled: Bool { get set }
}

// MARK: - Item

public protocol ItemProtocol {
    var selledBy: String { get set }
    var order: String { get set }
    var product: DocumentReference? { get set }
    var sku: String { get set }
    var isCancelled: Bool { get set }
}

public enum TradableErrorCode: String, Codable {
    case invalidArgument    = "invalidArgument"
    case lessMinimumAmount  = "lessMinimumAmount"
    case invalidCurrency    = "invalidCurrency"
    case invalidAmount      = "invalidAmount"
    case outOfStock         = "outOfStock"
    case invalidStatus      = "invalidStatus"
    case internalError      = "internal"
}
