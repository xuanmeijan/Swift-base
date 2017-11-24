//
//  JTLog.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/24.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import Foundation

/*
 *   日志管理
 */
class HDLog {
    
    static func LogOut(_ obj:Any){
        
        if Constants.HDLOG {
            
            print("\(obj)")
            
        }
        
    }
    
    static func LogOut(_ obj_name:Any,obj:Any){
        
        if Constants.HDLOG {
            
            print("\(obj_name):  \(obj)")
            
        }
        
    }
    
    static func LogClassDestory(_ className:Any){
        
        if Constants.HDLOG {
            
            print("\(className) destory")
            
        }
    }
    
}
