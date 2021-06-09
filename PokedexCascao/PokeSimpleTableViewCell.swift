//
//  PokeSimpleTableViewCell.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 08/06/21.
//

import UIKit

class PokeSimpleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokeName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
