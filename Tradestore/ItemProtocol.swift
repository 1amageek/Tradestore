//
//  ItemProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import FirebaseFirestore

public protocol ItemProtocol {
    var selledBy: String { get set }
    var orderReference: DocumentReference! { get set }
    var productReference: DocumentReference? { get set }
    var skuReferenceku: DocumentReference! { get set }
    var stockReference: DocumentReference? { get set }
    var isCancelled: Bool { get set }
}
