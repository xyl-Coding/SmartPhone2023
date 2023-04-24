//
//  TableViewCellHome.swift
//  FinalProject
//
//  Created by Xiangyang Liu on 4/22/23.
//

import UIKit
import Foundation

class TableViewCellHome: UITableViewCell {
    @IBOutlet weak var lblImageTitlecell: UILabel!
    
    @IBOutlet weak var MyLocation2cell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var lblImageViewcell: UIImageView!
 
    @IBOutlet weak var MyLocationcell: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
