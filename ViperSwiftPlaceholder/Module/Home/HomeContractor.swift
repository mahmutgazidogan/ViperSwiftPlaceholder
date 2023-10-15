//
//  HomeContractor.swift
//  ViperSwiftPlaceholder
//
//  Created by Mahmut Gazi Doğan on 11.10.2023.
//

import Foundation

protocol HomeInteractorOutputs {
    func onSuccessSearch()
    func onErrorSearch()
}

protocol HomeViewInputs {
    func configure()
    func reloadTableView(cats: [CatEntity])
    func setupTableViewCell()
    func indicatorView(animate: Bool)
    func sortByTitle()
}

protocol HomeViewPresenterInput {
    func viewDidLoad()
    func fetchCats()
    func onTapCell(model: CatEntity)
}
