//
//  JTCommon.swift
//  iOS-base
//
//  Created by 江豚os on 2017/11/21.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

class JTCommon: NSObject {

    enum RequestHTTPMethod: String {
        case Get = "Get"
        case Post = "Post"
    }
    
    ///alert提示框
    static func showAlert(vc:UIViewController, msg: String!) {
        let alertController = UIAlertController.init(title: "提示", message: msg, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default) { (alert) in
        }
        alertController.addAction(action)
        vc.present(alertController, animated: true) {  }
    }
    
    ///密码正则验证
    static func isValidatePassword(pwd: String) -> Bool {
        let pwdRegex = "^.{6,32}$"
        let pwdTest = NSPredicate(format: "SELF MATCHES %@",pwdRegex)
        return pwdTest.evaluate(with: pwd)
    }
    
    ///手机号正则验证
    static func isValidateMobile(mobile: String) -> Bool {
        let phoneRegex = "^1[123456789]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: mobile)
    }
    
    ///邮箱正则验证
    static func isValidateEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    ///身份证验证
    static func isCardId(cardid: String) -> Bool {
        let emailRegex = "(^\\d{15}$)|(^\\d{17}([0-9]|X)$)"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: cardid)
    }
    
    ///密码MD5加密
    
    ///去除字符串两边空格
    static func getTextByTrim(text:String) -> String
    {
        return text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /**限制 textField 输入类型*/
    static func contrastInput(contrastType: String, input: String) -> String {
        let cs = NSCharacterSet(charactersIn: contrastType).inverted
        let contrast = input.components(separatedBy: cs).joined(separator: "")
        return contrast
    }
    
    ///时间格式
    enum DateFormat: String {
        case yyyy_MM_dd = "yyyy-MM-dd"
        case yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    }
    
}
