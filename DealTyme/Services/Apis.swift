//
//  Apis.swift
//  DealTyme
//
//  Created by Apple on 24/01/2019.
//  Copyright © 2019 Ali Apple. All rights reserved.
//

import Foundation

typealias CompletionHanlder = (_ Success: Bool) -> ()

let port = "2003"

let URL_UserLogin = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/user/login"
let URL_UserSignup = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/user/signup"
let URL_UserCheckEmail = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/user/emailCheck"
let URL_insertOTP = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/otp/insert"
let URL_otpVerify = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/otp/verify"
let URL_UserVerifyUpdate = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/user/verify/update"
let URL_OtpUpdate = "http://ec2-3-17-59-167.us-east-2.compute.amazonaws.com:\(port)/api/v1/otp/update"


// verify
//
// last otp update


// s3

let s3_baseURL = "https://s3.ap-south-1.amazonaws.com/itrainers/"
var otpCodeID: Int = 0
