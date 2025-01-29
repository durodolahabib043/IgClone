//
//  Comment.swift
//  KDInstagram
//
//  Created by Sam Ding on 7/13/20.
//  Copyright © 2020 Kaishan Ding. All rights reserved.
//

import Foundation

struct Comment: Identifiable {
    var id = UUID()
    var user: User
    var content: String
    var date: Date
    var likes: Int
}
