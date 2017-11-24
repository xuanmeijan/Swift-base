//
//  JTBaseController.swift
//  Swift-base
//
//  Created by 江豚os on 2017/11/22.
//  Copyright © 2017年 江豚os. All rights reserved.
//

import UIKit

class JTBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override  open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    deinit {
        print("\(classForCoder) deinit");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }

}
