//
//  Message.swift
//  Messenger
//
//  Created by Hermine M on 20/03/2022.
//

import Foundation

enum MessageType: String {
    case sent
    case received
}

struct Message: Hashable {
    let text: String
    let type: MessageType
    let created: Date
}
