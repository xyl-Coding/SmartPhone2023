//
//  ViewControllerUploadIMG.swift
//  FinalProject
//
//

import UIKit
import CoreLocation

class ViewControllerUploadIMG: UIViewController,UIImagePickerControllerDelegate, CLLocationManagerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var lblTitle: UILabel!
  

    @IBOutlet weak var lblLocation: UILabel!
    
   
    @IBOutlet weak var UploadView: UIImageView!
    
    var UploadProtocol: UploadImageProtocol?
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        locationManager.startUpdatingLocation()
    }

    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
          if status == .authorizedWhenInUse {
              locationManager.startUpdatingLocation()
          }
      }
 
    @IBAction func UploadAction(_ sender: Any) {
        guard let img = UploadView.image else {return}
        
        guard let title = lblTitle.text else {return}
        
        guard let location = lblLocation.text else {return}
        
        UploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title)
     
        
        self.tabBarController?.selectedIndex = 0
        
    }

    @IBAction func takeAPicAction(_ sender: Any) {
        
        locationManager.requestLocation()
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            UploadView.image = image
        }
        picker.dismiss(animated: true)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
       // let lat = location.coordinate.latitude
       // let lng = location.coordinate.longitude
            
       // MyLocation.text = "Lat: \(lat)"
       // MyLocation2.text = "Lng: \(lng)"
        
        getAddressFromLocation(location: location)
    }
    
    func getAddressFromLocation(location: CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location){placemarks, error in
            if(error != nil){
                print(error)
                return
            }
            var address = ""
            guard let place = placemarks?.first else {return}
            if place.name !=  nil{
                address += place.name! + ", "
            }
            if place.locality !=  nil{
                address += place.locality! + ", "
            }
            if place.subLocality !=  nil{
                address += place.subLocality! + ", "
            }
            if place.country !=  nil{
                address += place.country! + ", "
            }
            if place.postalCode !=  nil{
                address += place.postalCode! + ", "
            }
            
            print(address)
            
            self.lblLocation.text = address
           
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
