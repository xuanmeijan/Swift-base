//
//  JTMessageViewController.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/22.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

class JTMessageViewController: JTBaseController {

    enum keyBoardButtonType :Int {
        //数字键盘类型按钮
        case  LDDButtonTypeNumber = 100 //数字键盘类型按钮
        case  LDDButtonTypeChar         //字符键盘类型按钮
        case  LDDButtonTypeSign       //符合键盘类型按钮
        case  LDDButtonTypeDelete      //删除按钮
        case  LDDButtonTypeFinsh       //完成按钮
        case  LDDButtonTypeShift       //大小写切换按钮
        case  LDDButtonTypeSpace     //空格按钮
        
        
    }
    var customkeyB:LDDKeyboardView?
    var passWordTxt:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setKeyBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setKeyBoard()  {
        
        customkeyB = LDDKeyboardView.loadKeyboardFromNib()
        customkeyB?.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 260)
        customkeyB?.delegate = self
        
        passWordTxt = UITextField.init(frame: CGRect.init(x: 80, y: 45, width: 100, height: 45))
        passWordTxt?.placeholder = "输入密码!"
        //leftViewMode = UITextFieldViewModeAlways;
        passWordTxt?.leftViewMode = UITextFieldViewMode.always
        passWordTxt?.borderStyle = UITextBorderStyle.roundedRect
        passWordTxt?.inputView = customkeyB?.inputView
        passWordTxt?.inputAccessoryView = customkeyB?.accessoryView
        
        
        self.view.addSubview(passWordTxt!)
    }

}

extension JTMessageViewController:LDDKeyboardViewDelegate{
    
    
    func clickKeyboardButton(_ button: UIButton!) {
        
        var inputString = self.passWordTxt?.text  ///获取输入的数据
        
        ///self.passwordField.text=[self.passwordField.text stringByAppendingString:button.currentTitle];
        
        
        switch button.tag {
        //            删除
        case keyBoardButtonType.LDDButtonTypeDelete.rawValue:
            //播放系统声音   KeyPressed 1105
            AudioServicesPlaySystemSound(1105)
            
            if (inputString?.isEmpty)! {
                print("字符串是空")
                return
            }else{
                inputString!.remove(at: inputString!.index(before: inputString!.endIndex))
                self.passWordTxt?.text = inputString
            }
            
            print(inputString ?? "abc")
            
            break
        //            切换大小写按钮 界面层的
        case keyBoardButtonType.LDDButtonTypeShift.rawValue:
            //将选中状态置反
            button.isSelected = !button.isSelected
            
            AudioServicesPlaySystemSound(1105);//按钮点击声音
            
            //获取子视图数组 因为子视图中有uibutton 也有uiview
            let charV = self.customkeyB?.charView.subviews
            
            var cyBtnArr = [CYRKeyboardButton]()
            //            var cyB = [CYRKeyboardButton]()
            
            for var  V in charV! {
                
                
                if V.isKind(of: CYRKeyboardButton.classForCoder()) { //判断子视图类型
                    
                    cyBtnArr.append(V as! CYRKeyboardButton)//将按钮加入到子视图数组中
                }
            }
            
            for var charBtn in cyBtnArr {
                
                //                charBtn.adjustsImageWhenHighlighted = false
                
                if button.isSelected {//shift按钮选中状态
                    
                    //                    UIView.animate(withDuration: 0.2, animations: {
                    let currentTUp = charBtn.currentTitle?.uppercased()
                    
                    charBtn.setTitle(currentTUp, for: .normal)
                    charBtn.input = charBtn.currentTitle
                    //                    })
                    
                }else{//shift按钮未选中
                    
                    //                    UIView .animate(withDuration: 0.2, animations: {
                    
                    let currentLow = charBtn.currentTitle?.lowercased()
                    charBtn.setTitle(currentLow, for: .normal)
                    charBtn.input = charBtn.currentTitle
                    //                    })
                    
                    
                }
            }
            break
            
        case keyBoardButtonType.LDDButtonTypeSpace.rawValue:
            
            AudioServicesPlaySystemSound(1105)
            
            button.backgroundColor = UIColor.init(red: 110/255.0, green: 110/255.0, blue: 110/255.0, alpha: 1.0)
            //在原有输入内容的基础上加上空格
            self.passWordTxt?.text = (self.passWordTxt?.text)! + " "
            button.backgroundColor = UIColor.white
            break
            
            
        case keyBoardButtonType.LDDButtonTypeFinsh.rawValue:
            AudioServicesPlaySystemSound(1105)
            //            释放第一响应
            self.passWordTxt?.resignFirstResponder()
            break
        default:  self.passWordTxt?.text = (self.passWordTxt?.text)! + button.currentTitle!
            break
            
        }
        
        
    }
}
