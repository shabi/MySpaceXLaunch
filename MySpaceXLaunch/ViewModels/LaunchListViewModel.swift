//
//  LaunchListViewModel.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 11/08/22.
//

import Foundation
import Combine

protocol LaunchListViewModelType {
    var launchViewModels: AnyPublisher<[LaunchListTableViewCellViewModel], Never> { get }
    var companyHeaderInfo: AnyPublisher<String, Never> { get }
//    var notifyError: AnyPublisher<Error, Never> { get }
    
    func fetchLaunches()
    func fetchCompanyInfo()
}

class LaunchListViewModel: LaunchListViewModelType {
    
    let apiService: RestAPIService
    var cancellables = Set<AnyCancellable>()
    
    private var launchViewModelsSubject: CurrentValueSubject<[LaunchListTableViewCellViewModel], Never> = CurrentValueSubject<[LaunchListTableViewCellViewModel], Never>([])
    
    private var companyHeaderInfoSubject: PassthroughSubject<String, Never> = PassthroughSubject<String, Never>()
   
    var companyHeaderInfo: AnyPublisher<String, Never> {
        companyHeaderInfoSubject.eraseToAnyPublisher()
    }
    
    var launchViewModels: AnyPublisher<[LaunchListTableViewCellViewModel], Never> {
        launchViewModelsSubject.eraseToAnyPublisher()
    }
    
    init(apiService: RestAPIService = RestAPIServiceProvider()) {
        self.apiService = apiService
        fetchLaunches()
        fetchCompanyInfo()
    }

    func fetchLaunches() {
        LaunchServiceProvider(networking: self.apiService)
            .getLaunchService()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    debugPrint(error)
                }
            }, receiveValue: { [weak self] launchResponse in
                guard let strongSelf = self else { return }
                strongSelf.processFetchedLaunches(launchResponse: launchResponse)
            })
            .store(in: &cancellables)
    }
    
    func fetchCompanyInfo() {
        CompanyInfoServiceProvider(networking: self.apiService)
            .getCompanyInfoService()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
//                    strongSelf.notifyError.accept(error)
                    debugPrint(error)
                }
            }, receiveValue: { [weak self] companyResponse in
                guard let strongSelf = self else { return }
                strongSelf.processFetchedCompanyInfo(companyInfoResponse: companyResponse)
            })
            .store(in: &cancellables)
    }
    func processFetchedCompanyInfo(companyInfoResponse: CompanyInfo?) {
        guard let companyInfo = companyInfoResponse else { return }
        let companyHeader = "\(companyInfo.name!) was founded by \(companyInfo.founder!) in \(companyInfo.founded!). It has now \(companyInfo.employees!) employees, \(companyInfo.launch_sites!) launch sites, and is valued at USD \(companyInfo.valuation!)."
        companyHeaderInfoSubject.send(companyHeader)
    }
    
    
    func processFetchedLaunches(launchResponse: [LaunchInfo]?) {
        guard let launches = launchResponse else { return }
        launchViewModelsSubject.send(convertLaunchesToLaunchListTableViewCellViewModels(launches: launches))
    }
    
    func convertLaunchesToLaunchListTableViewCellViewModels(launches: [LaunchInfo]) -> [LaunchListTableViewCellViewModel] {
        var launchListTableViewCellViewModels: [LaunchListTableViewCellViewModel] = []
        for launch in launches {
            launchListTableViewCellViewModels.append(LaunchListTableViewCellViewModel(launch: launch))
        }
        return launchListTableViewCellViewModels
    }

}
