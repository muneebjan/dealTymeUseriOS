//
//  AuthService.swift
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class AuthServices {
    
    
    var checkemailstatus = ""
    var loginstatus = ""
    
    static let instance = AuthServices()

    func user_login(email: String, password: String, completion: @escaping CompletionHanlder) {
        
        let parameters: Parameters = [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(URL_UserLogin, method: .get, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseString {
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            
            guard let data = response.data else{return}
            let json: JSON
            do{
                json = try JSON(data: data)
                print("Json data = \(json)")
                
                UserInfo.sharedInstance.userid = json[0]["id"].intValue
                UserInfo.sharedInstance.name = json[0]["name"].stringValue
                UserInfo.sharedInstance.email = json[0]["email"].stringValue
                UserInfo.sharedInstance.password = json[0]["password"].stringValue
                UserInfo.sharedInstance.phone = json[0]["phone"].intValue
                UserInfo.sharedInstance.image = json[0]["image"].stringValue
                UserInfo.sharedInstance.token = json[0]["token"].stringValue
                UserInfo.sharedInstance.isverify = json[0]["isVerify"].intValue
                UserInfo.sharedInstance.status = json[0]["status"].intValue
                print(json.count)
                if(json.count != 0){
                    self.loginstatus = "successsful"
                    completion(true)
                }else{
                    self.loginstatus = "not success"
                    completion(true)
                }
                
//                completion(true)
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
            
        }
    }
    
    func user_signup(name: String, password: String, email: String, completion: @escaping CompletionHanlder) {
        
        let parameters: Parameters = [
            "name":name,
            "password":password,
            "email":email
        ]
        
        Alamofire.request(URL_UserSignup, method: .post, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseJSON {
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            
            guard let data = response.data else{return}
            let json: JSON
            do{
                json = try JSON(data: data)
                
                UserInfo.sharedInstance.userid = json[0]["id"].intValue
                self.user_insertOTPcode(userid: UserInfo.sharedInstance.userid!, completion: { (success) in
                    if(success){
                        print("otp verification api successfull")
                    }else{
                        print("otp not successfull")
                    }
                })
                
                completion(true)
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
        }
        
    }
    
    func user_checkEmail(email: String, completion: @escaping CompletionHanlder) {
        let parameters: Parameters = [
            "email": email
        ]
        Alamofire.request(URL_UserCheckEmail, method: .get, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseJSON {
            
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            guard let data = response.data else{return}
            let json: JSON
            do{
                json = try JSON(data: data)
                if(json[0]["number"].stringValue != "0"){
                    self.checkemailstatus = "Exists"
                    completion(true)
                }else{
                    self.checkemailstatus = "not Exists"
                    completion(true)
                }
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
            
        }
        
    }
    
    // Insert OTP code
    func user_insertOTPcode(userid: Int, completion: @escaping CompletionHanlder) {
        let parameters: Parameters = [
            "uid": userid
        ]
        Alamofire.request(URL_insertOTP, method: .post, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseJSON {
            
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            guard let data = response.data else{return}
            let json: JSON
            do{
                
                json = try JSON(data: data)
                print("Json OTP Data = \(json)")
                let otpID = json[0]["id"].intValue
                otpCodeID = otpID
//                UserDefaults.standard.set(otpID, forKey: "otpid")
//                UserDefaults.standard.synchronize()
                
                completion(true)
                
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
            
        }
        
    }
    
    
    // Verification OTP code
    //?uid=23&code=1234&id=22
    
    func user_verifyOtpCode(userid: Int, code: Int, otpcodeID: Int, completion: @escaping CompletionHanlder) {
        let parameters: Parameters = [
            "uid": userid,
            "code": code,
            "id": otpcodeID
        ]
        Alamofire.request(URL_otpVerify, method: .get, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseJSON {
            
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            guard let data = response.data else{return}
            let json: JSON
            do{
                
                json = try JSON(data: data)
                print("Json OTP verification Data = \(json)")
//                let otpID = json[0]["id"].intValue
//                otpCode = otpID
                //                UserDefaults.standard.set(otpID, forKey: "otpid")
                //                UserDefaults.standard.synchronize()
                
                completion(true)
                
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
            
        }
        
    }
    
    
    // User verification update code
    func user_verifyUpdated(userid: Int, completion: @escaping CompletionHanlder) {
        let parameters: Parameters = [
            "uid": userid
        ]
        Alamofire.request(URL_UserVerifyUpdate, method: .post, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseJSON {
            
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            guard let data = response.data else{return}
            let json: JSON
            do{
                
                json = try JSON(data: data)
                print("Json OTP Data = \(json)")
                
                completion(true)
                
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
            
        }
        
    }
    
    // User verification update code
    func user_OtpUpdated(userid: Int, id: Int, completion: @escaping CompletionHanlder) {
        let parameters: Parameters = [
            "uid": userid,
            "id": id
        ]
        Alamofire.request(URL_OtpUpdate, method: .post, parameters: parameters, encoding:URLEncoding.queryString, headers: nil).responseJSON {
            
            (response) in //Reponse is a temporary Variable where we get the result . we can write anything
            guard let data = response.data else{return}
            let json: JSON
            do{
                
                json = try JSON(data: data)
                print("Json OTP Data = \(json)")
                
                completion(true)
                
            }
            catch
            {
                if response.result.error == nil{
                    completion(true)
                }
                else{
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
            }
            
        }
        
    }
    
}
