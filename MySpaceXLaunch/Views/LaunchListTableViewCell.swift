//
//  LaunchTableViewCell.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 07/08/22.
//

import UIKit
import Combine

class LaunchListTableViewCell: UITableViewCell {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var missionNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var rocketLabel: UILabel!
    @IBOutlet var daysLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    var viewModel: LaunchListTableViewCellViewModelType!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupListeners()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupViews() {
        selectionStyle = .none
    }
    
    func setupListeners() {
        self.missionNameLabel.text = viewModel.mission
        self.dateLabel.text = viewModel.dateTime
        self.rocketLabel.text = viewModel.rocketName
        self.daysLabel.text = viewModel.launchDay
        self.statusLabel.text = viewModel.status ? "Success" : "Fail"
        if let imageLink = viewModel.rocketImageLink {
            self.iconImageView.setImageFromUrl(imageURL: imageLink)
        }
        
    }
}
