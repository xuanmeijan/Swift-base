//
//  JTHomeViewController.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/22.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

class JTHomeViewController: JTBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        JTCommon.showSuccessHUD(self.view, title: "分享成功")
        
        var imageView = UIImageView ()
        imageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight);
        imageView.image = UIImage.init(named: "guide_step4")
        self.view.addSubview(imageView)
        
        let button = UIButton ()
        button.frame = CGRect(x: 200, y: 20, width: 150, height: 80);
        button.setTitle("点击打开", for: UIControlState())
        button.setTitleColor(Constants.HDYellowColor, for: UIControlState.normal)
        button.addTarget(self, action: #selector(click), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
    }

    @objc func click() {
        let vc = JTMineViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
