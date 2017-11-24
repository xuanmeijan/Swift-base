//
//  JTUserUtils.swift
//  iOS-base
//
//  Created by 江豚os on 2017/11/21.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit
let U_INFO = "U_INFO"//用户信息
let U_JSONINFO = "U_JSONINFO"//json用户信息
let U_TOKEN = "TOKEN"
let USER_DEFAULT = UserDefaults.standard
let U_WEBURL = "WEBURL"

class JTUserUtils: NSObject {

    //是否登陆
    static func isUserLogin() -> Bool {
        if (USER_DEFAULT.value(forKey: U_TOKEN) != nil){
            return true
        }else {
            return false
        }
    }
    
    static func saveAcessToken(token : String) {
        USER_DEFAULT.set(token, forKey: U_TOKEN)
        USER_DEFAULT.synchronize()
    }
    
    static func deleteToken()  {
        USER_DEFAULT.removeObject(forKey: U_TOKEN)
        USER_DEFAULT.synchronize()
    }
    
    static func getToken() -> String {
        let token = USER_DEFAULT.value(forKey: U_TOKEN)
        return token == nil ? "" :token as! String
    }
    
    class func saveUserInfo(info:JTUserEntity)  {
        USER_DEFAULT.set(NSKeyedArchiver.archivedData(withRootObject: info), forKey: U_INFO)
        USER_DEFAULT.synchronize()
    }
    class func getUserInfo() -> JTUserEntity {
        let userInfo = USER_DEFAULT.value(forKey: U_INFO)
        if userInfo != nil {
            let userData = NSKeyedUnarchiver.unarchiveObject(with: userInfo as! Data)
            if userData != nil {
                return userData as! JTUserEntity
            }else{
                return JTUserEntity()
            }
        }else{
            return JTUserEntity()
        }
    }
    
    class func saveJsonUser(info:Any)  {
        USER_DEFAULT.set(info, forKey: U_JSONINFO)
        USER_DEFAULT.synchronize()
    }
    class func getJsonUser() -> Any {
        return USER_DEFAULT.value(forKey: U_JSONINFO)!
    }
}
