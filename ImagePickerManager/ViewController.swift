//
//  ViewController.swift
//  ImagePickerManager
//
//  Created by Nvr on 2018/9/3.
//  Copyright © 2018年 ZY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        _ = ZYImagePickerManager.init(titleString: "选择身份证正面", vc: self) { (imageInfo) in
            print(imageInfo)
        }
    }
    
}

