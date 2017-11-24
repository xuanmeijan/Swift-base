//
//  JTCommon.swift
//  iOS-base
//
//  Created by 江豚os on 2017/11/21.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit
import Alamofire

class JTCommon: NSObject {

    enum RequestHTTPMethod: String {
        case Get = "Get"
        case Post = "Post"
    }
    
    static func JTFrame(_ x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)->CGRect{
        return  CGRect(x: x, y: y, width: width, height: height)
    }
    
    static func HDfromHexValue(_ hex:UInt,alpha:CGFloat)->UIColor{
        
        return UIColor(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
        
    }
    
    static func HDColor(_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->(UIColor){
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a);
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
    
    /**
     加载数据时显示的动画
     
     *  @ parameter view: hud的父视图
     */
    static func showProgressHUD(_ view:UIView){
        
        hidProgressHUD(view)
        
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = MBProgressHUDMode.customView
        hud.color = JTCommon.HDfromHexValue(0x000000, alpha: 0.4)
        hud.margin = 10
        hud.dimBackground = false
        
        let waitView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        let animation:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        animation.image = UIImage(named: "hud_waiting_animation_white");
        waitView.addSubview(animation)
        
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        logo.image = UIImage(named: "hud_waiting_logo")
        waitView.addSubview(logo)
        
        hud.customView = waitView
        
        /**
         *  动画
         */
        
        let rotationAnimation:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI*2.0)
        rotationAnimation.duration = 1;
        rotationAnimation.isCumulative = true;
        rotationAnimation.repeatCount = .infinity
        animation.layer.add(rotationAnimation, forKey: "rotationAnimation")
        
        hud.removeFromSuperViewOnHide = true
        
        hud.show(true)
        
    }
    
    /**
     隐藏动画
     
     *  @ parameter view: hud的父视图
     */
    static func hidProgressHUD(_ view:UIView){
        
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    /**
     显示文本
     
     *  @ parameter view:  hud的父视图
     *  @ parameter title: 显示的文本内容
     */
    static func  showWarningHUD(_ view:UIView,title:String){
        
        hidProgressHUD(view)
        
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        hud.color = HDfromHexValue(0x000000, alpha: 0.6)
        hud.margin = 10
        hud.labelColor = HDColor(255, g: 255, b: 255, a: 1.0)
        hud.labelFont = UIFont.systemFont(ofSize: 15)
        
        hud.mode = MBProgressHUDMode.customView;
        hud.customView = UIImageView(image: UIImage(named: "37x-warning"))
        
        if title.characters.count>0 {
            
            hud.labelText = title;
            
        }
        
        hud.removeFromSuperViewOnHide = true;
        hud.hide(true, afterDelay: 1.5)
        
    }
    
    /**
     显示文本
     
     *  @ parameter view:  hud的父视图
     *  @ parameter title: 显示的文本内容
     */
    static func  showSuccessHUD(_ view:UIView,title:String){
        
        hidProgressHUD(view)
        
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        hud.color = HDfromHexValue(0x000000, alpha: 0.6)
        hud.margin = 10
        hud.labelColor = HDColor(255, g: 255, b: 255, a: 1.0)
        hud.labelFont = UIFont.systemFont(ofSize: 15)
        
        hud.mode = MBProgressHUDMode.customView;
        hud.customView = UIImageView(image: UIImage(named: "37x-success"))
        
        if title.characters.count>0 {
            
            hud.labelText = title;
            
        }
        
        hud.removeFromSuperViewOnHide = true;
        hud.hide(true, afterDelay: 1.5)
        
    }
    
    
    /**
     *  网络是否可用
     */
    static func networkIsReachable()->Bool{
        
        var ret:Bool!
        let manager = NetworkReachabilityManager()
        
        if  manager?.isReachable ?? false {
            
            //            if ((manager?.isReachableOnEthernetOrWiFi) != nil) {
            //                //do some stuff
            //            }else if(manager?.isReachableOnWWAN)! {
            //                //do some stuff
            //            }
            //
            ret = true
        }
        else {
            ret = false
        }
        return ret
        
    }
    
    /**
     *  对图片尺寸进行压缩
     *
     *  @param image   UIImage
     *  @param newSize CGSize
     *
     *  @return UIImage
     */
    static func imageScaledToSize(_ image:UIImage,newSize:CGSize)->UIImage{
        
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
    }
}
