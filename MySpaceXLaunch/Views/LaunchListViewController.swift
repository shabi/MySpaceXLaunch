//
//  LaunchListViewController.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 07/08/22.
//

import UIKit
import Combine

class LaunchListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var companyInformation: String!
    var viewModel: LaunchListViewModelType = LaunchListViewModel()
    var cancellables = Set<AnyCancellable>()
    var launchListTableViewCellViewModel: [LaunchListTableViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        setupListeners()
    }
    
    func setupListeners() {

        viewModel
            .launchViewModels
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.launchListTableViewCellViewModel = value
                self?.tableView.reloadData()
                
            }
            .store(in: &cancellables)
        
        viewModel
            .companyHeaderInfo
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.companyInformation = value
            }
            .store(in: &cancellables)

//        viewModel.notifyError
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] value in
//                self?.tableView.reloadData()
//            }
//            .store(in: &cancellables)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return launchListTableViewCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier:
                                                            "ComapnyHeaderCell") {
                cell.textLabel?.text = self.companyInformation
                return cell
            }
        }
        
        guard launchListTableViewCellViewModel.count > 0 else {
            return UITableViewCell()
        }
        return listingCell(tableView, indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            let rocketDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RocketDetailViewController") as! RocketDetailViewController
            // pass your data and configure the viewcontroller here
            rocketDetailViewController.launchInfo = launchListTableViewCellViewModel[indexPath.row].launch
            navigationController?.pushViewController(rocketDetailViewController, animated: true)
        }
    }
    
    private func listingCell(_ tableView: UITableView, _ indexPath: IndexPath) -> LaunchListTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "\(LaunchListTableViewCell.self)") as! LaunchListTableViewCell
        let vm = launchListTableViewCellViewModel[indexPath.row]
        
        vm.configure(cell)
        return cell
    }
}

