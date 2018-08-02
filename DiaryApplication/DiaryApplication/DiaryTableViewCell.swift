//
//  DiaryTableViewCell.swift
//  DiaryApplication
//
//  Created by Yash Singh on 7/13/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {

    @IBOutlet weak var diaryNoteTitleLabel: UILabel!
    
    @IBOutlet weak var diaryAgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
