//
//  UploadImageViewController.swift
//  InstaImage
//
//  Created by Xiangyang Liu on 4/22/23.
//

import UIKit
import CoreLocation

class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate,CLLocationManagerDelegate{
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var UploadAPic: UIButton!
    @IBAction func TakePictureAction(_ sender: Any) {
        let actionSheet = UIAlertController(title:"Take a Picture", message: "Something", preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: "Camera", style: .default){action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
            }
           
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){action in
            print("Cancel")
        }
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getLatLongAction(_ sender: Any) {
    }
    
    @IBOutlet var position: UILabel!
    
    /*
     @IBOutlet var position: UILabel!
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    let locationManager = CLLocationManager()

}
