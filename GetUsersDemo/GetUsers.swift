//
//  GetUsers.swift
//  GetUsersDemo
//
//  Created by Tai on 2022/10/21.
//

import Foundation

struct GetUsers: Codable {
    let data: [GetUserDataDetail]
}

struct GetUserDataDetail: Codable {
    var email: String
    var firstName: String
    var lastName: String
    var avatar: URL
}
