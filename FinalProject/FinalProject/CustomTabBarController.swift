//
//  CustomTabBarController.swift
//  FinalProject
//
//
import UIKit
import Foundation

class CustomTabBarController : UITabBarController{
    @IBInspectable var initialIndex : Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
        
        let hometViewController = viewControllers?[0] as! ViewControllerIMG
        
        let uploadPicVC = viewControllers?[1] as!
        ViewControllerUploadIMG
    
        uploadPicVC.UploadProtocol = hometViewController.self
}

}
