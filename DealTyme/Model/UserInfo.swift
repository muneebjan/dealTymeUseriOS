//
//  UserInfo.swift
//  DealTyme
//
//  Created by Ali Apple on 11/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import Foundation

class UserInfo: NSObject{
    static let sharedInstance = UserInfo()
    var userid: Int?
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var phone: Int?
    var image: String = ""
    var token: String = ""
    var isverify: Int?
    var status: Int?
}
