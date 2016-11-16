//
//  ViewController.swift
//  SFSocketTest
//
//  Created by 孔祥波 on 16/11/2016.
//  Copyright © 2016 Kong XiangBo. All rights reserved.
//

import UIKit
import SFSocket
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let h = SFHTTPHeader.init(data: http503.data(using: .utf8)!){
            print(h.app)
        }
        if  let b = SFHTTPRequestHeader.init(data: http503.data(using: .utf8)!){
            print(b.Host)
        }
        if  let b = SFHTTPResponseHeader.init(data: http503.data(using: .utf8)!){
            print(b.sCode)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

