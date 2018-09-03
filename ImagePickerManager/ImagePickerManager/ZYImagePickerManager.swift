//
//  ImagePickerManager.swift
//  ImagePickerManager
//
//  Created by Nvr on 2018/9/3.
//  Copyright © 2018年 ZY. All rights reserved.
//

import UIKit

public typealias SelectImageCallback = (_ image:UIImage)->()

public class ZYImagePickerManager: NSObject {
    
    public var callBack:SelectImageCallback?
    
    lazy var imageAlert:UIAlertController = {
        let alert = UIAlertController.init(title: "选择照片", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "相机", style: UIAlertActionStyle.default, handler: { (action) in
            self.goToSelectPhotoWithType(source: .camera)
        }))
        alert.addAction(UIAlertAction(title: "相册", style: UIAlertActionStyle.default, handler: { (action) in
            self.goToSelectPhotoWithType(source: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: { (action) in
            self.goToSelectPhotoWithType(source: .photoLibrary)
        }))
    
        return alert
    }()
    
    private var viewController:UIViewController?
    
    // MARK: 图片选择器界面
    var imagePickerController: UIImagePickerController {
        get {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            return imagePicker
        }
    }
    
    convenience init(titleString:String,vc:UIViewController,selectImage:@escaping SelectImageCallback){
        self.init()
        callBack = selectImage
        imageAlert.title = titleString
        viewController = vc
        vc.present(imageAlert, animated: true, completion: nil)
    }
    
    func goToSelectPhotoWithType(source:UIImagePickerControllerSourceType){
        imagePickerController.sourceType = source
        viewController?.present(imagePickerController, animated: true, completion: nil)
    }
    
}


extension ZYImagePickerManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        callBack!(info[UIImagePickerControllerOriginalImage] as! UIImage)
    }
    
}
