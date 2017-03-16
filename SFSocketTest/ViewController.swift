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
    let q = DispatchQueue.init(label: "com.yarshure.test")
    var data = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        let a:Float = 10.23
        print(String.init(format: "%.0f", a))
        
        if let h = SFHTTPHeader.init(data: http503.data(using: .utf8)!){
            print(h.app)
        }
        if  let b = SFHTTPRequestHeader.init(data: http503.data(using: .utf8)!){
            print(b.Host)
        }
        if  let b = SFHTTPResponseHeader.init(data: http503.data(using: .utf8)!){
            print(b.sCode)
        }
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.test(_:)), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    func test(_ t:Timer) {
        
        
        q.async {
            let t  = Date()
            autoreleasepool(invoking: {
                
                
                let enc = SSEncrypt.init(password: "aes-256", method: "chacha20")
                //for _ in 0 ..<  10000 {
                
                let st = "sdlfjlsadfjalsdjfalsdfjlasf"
                let data = st.data(using: .utf8)!
                for i in 0 ..< 10 {
                    let out  = enc.encrypt(encrypt_bytes: data)
                    //                result.append(out!)
                    //                let x = enc.decrypt(encrypt_bytes: out!)
                    print(out! as NSData)
                    let d2 = enc.decrypt(encrypt_bytes: out!)
                    
                    let str = String.init(data: d2!, encoding: .utf8)
                    if str == st {
                        print("test pass")
                    }
                    print("\(str!)")
                }
                
                DispatchQueue.main.async {[weak self] in
                    //self!.update(out!)
                }
                // usleep(5000)
                //}
                let tw = Date().timeIntervalSince(t)
                print(tw)
                
            })
            //usleep(500)
           
        }
        
    }
    func fin() {
        print(data.count)
       
        print(data as NSData)
    }
    func update(_ d:Data){
        if data.count != 0 {
            data.removeAll(keepingCapacity: true)
        }
        data.append(d)
        
    }
    @IBAction func testEncrypt(_ sender: Any) {
        //test()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func test(){
//        CCCryptorStatus CCCryptorGCM(
//            CCOperation 	op,				/* kCCEncrypt, kCCDecrypt */
//            CCAlgorithm		alg,
//            const void 		*key,			/* raw key material */
//            size_t 			keyLength,
//            const void 		*iv,
//            size_t 			ivLen,
//            const void 		*aData,
//            size_t 			aDataLen,
//            const void 		*dataIn,
//            size_t 			dataInLength,
//            void 			*dataOut,
//            void 		    *tagOut,
//            size_t 			*tagLength)
//        __OSX_AVAILABLE_STARTING(__MAC_10_8, __IPHONE_5_0);
        var str = "Hello, playground"
        
        let d = dlopen("/usr/lib/system/libcommonCrypto.dylib", RTLD_NOW);
        
        let CCCryptorGCM = dlsym(d, "CCCryptorGCM");
        //fprintf(stderr, "CCCryptorGCM=%x\n", CCCryptorGCM);
        
        let aes_key = "pass".data(using: .utf8)!
        let aes_iv = "password".data(using: .utf8)!
        var taglen = 16
        var tag = Data.init(count: 16)
//        let cs = CCCryptorGCM(1,
//                          0,
//                          aes_key,
//                          4,
//                          0,
//                          0,
//                          0,
//                          0,
//                          &datab[52],
//                          item_length,
//                          "abc",
//                          (tag as NSData).bytes,
//                          &taglen);
    }

}

