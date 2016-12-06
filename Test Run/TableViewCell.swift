//
//  TableViewCell.swift
//  Test Run
//
//  Created by ADMINISTRADORUTM on 05/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblDerecha: UILabel!
    @IBOutlet weak var lblIzquierda: UILabel!
    @IBOutlet weak var lblCentral: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
