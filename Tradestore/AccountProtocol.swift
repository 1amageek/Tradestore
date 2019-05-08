//
//  AccountProtocol.swift
//  Tradestore
//
//  Created by 1amageek on 2019/05/08.
//  Copyright © 2019 Stamp Inc. All rights reserved.
//

import Foundation

public protocol AccountMetadataProtocol: Codable {

}

public protocol AccountProtocol {

    associatedtype Metadata: AccountMetadataProtocol

    var country: String { get set }
    var isRejected: Bool { get set }
    var isSigned: Bool { get set }
    var balance: Balance { get set }
    var metadata: Metadata { get set }
}
