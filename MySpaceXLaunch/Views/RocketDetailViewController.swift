//
//  RocketDetailViewController.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 12/08/22.
//

import UIKit
import Foundation

class RocketDetailViewController: UIViewController {
    @IBOutlet var rocketImageView: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    
    var launchInfo: LaunchInfo?
    private var viewModel: RocketDetailViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = RocketDetailViewModel(launchInfo: launchInfo)
        self.title = launchInfo?.mission_name
        self.detailLabel.text = launchInfo?.details
        if let imageLink = viewModel?.imageLink {
            self.rocketImageView.setImageFromUrl(imageURL: imageLink)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
   
    @IBAction func tapButtonAction(sender: UIButton) {
        guard let wikiLink = viewModel?.wikiLink else { return }
        let url = URL(string: wikiLink)
        
        guard let wikiUrl = url, UIApplication.shared.canOpenURL(wikiUrl) else { return }
        UIApplication.shared.open(wikiUrl, options: [:], completionHandler: nil)
    }
    
    func revealNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.view.backgroundColor = .white
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func hideNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}

