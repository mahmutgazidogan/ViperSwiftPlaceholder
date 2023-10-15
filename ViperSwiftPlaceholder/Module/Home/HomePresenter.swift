//
//  HomePresenter.swift
//  ViperSwiftPlaceholder
//
//  Created by Mahmut Gazi Doğan on 11.10.2023.
//

import Foundation

final class HomePresenter: HomeViewPresenterInput {
    
    let interactor: HomeInteractor
    let view: HomeViewInputs
    
    init(interactor: HomeInteractor, view: HomeViewInputs) {
        self.interactor = interactor
        self.view = view
    }
    
    func fetchCats() {
        interactor.fetchCats(url: "\(ProductConstants.BASE_URL)\(ServicePath.http.rawValue)") { response in
            switch response {
            case .success(let value):
                self.view.reloadTableView(cats: value)
            case .failure(let error):
                print(error)
            }
            self.view.indicatorView(animate: false)
        }
        
    }
    
    func onTapCell(model: CatEntity) {
        print(model)
    }
    
    func viewDidLoad() {
        view.indicatorView(animate: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.fetchCats()
        }
    }
    
}
