////
////  UIViewController+Photo.swift
////  TSBaseViewController_Swift
////
////  Created by three stone 王 on 2018/11/20.
////  Copyright © 2018年 three stone 王. All rights reserved.
////
//
//import Foundation
//import UIKit
//import AssetsLibrary
//import MobileCoreServices
//
//typealias TSPhotoResultBlock = (AnyObject) -> ()
//// z这个之后完善
//extension UIViewController {
//
//    public enum PhotoLibraryMediaType {
//
//        case `default`
//
//        case onlyPhoto
//
//        case onlyVideo
//
//        case both
//    }
//
//    open var mediaType: PhotoLibraryMediaType? {
//
//        set {
//            objc_setAssociatedObject(self, "mediaType", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        get {
//
//            return objc_getAssociatedObject(self, "mediaType") as? PhotoLibraryMediaType
//        }
//    }
//    open var imagePicker: UIImagePickerController? {
//
//        set {
//            objc_setAssociatedObject(self, "imageicker", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//        get {
//
//            return objc_getAssociatedObject(self, "imageicker") as? UIImagePickerController
//        }
//    }
//
//    internal var resultBlock: TSPhotoResultBlock? {
//
//        set {
//
//            objc_setAssociatedObject(self, "resultBlock", newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC);
//        }
//        get {
//
//            return objc_getAssociatedObject(self, "resultBlock") as? TSPhotoResultBlock
//        }
//    }
//
//}
//
//// MARK: photoActionShow 目前先用 UIAlertController
//extension UIViewController {
//
//    open func photoActionShow(_ title: String ,_ msg: String) {
//
//        let alert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
//
//        let cancle = UIAlertAction(title: "取消", style: .cancel) { (action) in
//
//            self.dismiss(animated: true, completion: nil)
//        }
//        let photo = UIAlertAction(title: "相册", style: .cancel) { (action) in
//
//            if self.imagePicker == nil {
//
//                self.imagePicker = UIImagePickerController()
//
//                self.imagePicker?.allowsEditing = true
//
//                self.imagePicker?.modalTransitionStyle = .coverVertical
//
//                self.imagePicker?.sourceType = .photoLibrary
//
//                self.imagePicker?.delegate = self
//
//                self.present(self.imagePicker!, animated: true, completion: nil)
//            }
//        }
//
//        let camera = UIAlertAction(title: "相机", style: .cancel) { (action) in
//
//            if !UIImagePickerController.isSourceTypeAvailable(.camera) {
//
//                return
//            }
//
//            if self.imagePicker == nil {
//
//                self.imagePicker = UIImagePickerController()
//
//                self.imagePicker?.allowsEditing = true
//
//                self.imagePicker?.modalTransitionStyle = .coverVertical
//
//                self.imagePicker?.sourceType = .camera
//
//                self.imagePicker?.delegate = self
//
//                self.present(self.imagePicker!, animated: true, completion: nil)
//            }
//        }
//
//        alert.addAction(cancle)
//
//        alert.addAction(photo)
//
//        alert.addAction(camera)
//
//        present(alert, animated: true, completion: nil)
//    }
//}
//// MARK: UINavigationControllerDelegate ,UIImagePickerControllerDelegate
//extension UIViewController: UINavigationControllerDelegate ,UIImagePickerControllerDelegate {
//
//    open func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        let mediaType = info[.mediaType] as! String
//
//        if mediaType == "\(kUTTypeImage)" {
//
//            var image: UIImage?
//
//            if picker.allowsEditing {
//
//                image = info[.editedImage] as? UIImage
//
//            } else {
//
//                image = info[.originalImage] as? UIImage
//            }
//
//            self.resultBlock!(image!)
//        } else if mediaType == "\(kUTTypeMovie)" {
//
//            let mediaURL = info[.mediaURL] as! URL
//
//            self.resultBlock!(mediaURL as AnyObject)
//        }
//    }
//
//    open func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//
//        dismiss(animated: true, completion: nil)
//    }
//
//}
