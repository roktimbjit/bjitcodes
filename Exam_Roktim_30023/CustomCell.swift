//
//  CustomCell.swift
//  Exam_Roktim_30023
//
//  Created by Bjit on 14/12/22.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var exdescription: UILabel!
    
    @IBOutlet weak var exdate: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
