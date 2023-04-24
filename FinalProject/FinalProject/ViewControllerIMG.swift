//
//  ViewControllerIMG.swift
//  FinalProject
//
//  Created by Xiangyang Liu on 4/22/23.
//

import UIKit

class ViewControllerIMG: UIViewController,UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    

    @IBOutlet weak var lblHomeImage: UITableView!
    
    var image : [UIImage] = [UIImage]()
    var imgTitle : [String] = [String]()
    var location = [String]()
    
    var uploadImageVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var lblHome: UILabel!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imgTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TableViewCellHome", owner: self)?.first as! TableViewCellHome
        cell.lblImageTitlecell.text = imgTitle[indexPath.row]
        cell.lblImageViewcell.image = image[indexPath.row]
        cell.MyLocation2cell.text = location[indexPath.row]
        
        return cell
    }
    
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        image.append(img)
        location.append(locationImg)
        imgTitle.append(titleImg)
        
        lblHomeImage.reloadData()
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
  
}
