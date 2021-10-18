//
//  WeatherTableViewCell.swift
//  WeatherTableViewCell
//
//  Created by Nouman Pervez on 07/09/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempratureLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(weatherViewModel: WeatherViewModel) {
        cityLabel.text = weatherViewModel.city
        tempratureLable.text = "\(weatherViewModel.temperature)"
    }

}
