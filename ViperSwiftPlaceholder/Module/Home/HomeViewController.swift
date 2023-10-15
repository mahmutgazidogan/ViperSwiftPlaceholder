//
//  HomeViewController.swift
//  ViperSwiftPlaceholder
//
//  Created by Mahmut Gazi Doğan on 11.10.2023.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private let labelTitle: UILabel = .init()
    private let homeTableViewController: UITableView = .init()
    private let indicator: UIActivityIndicatorView = .init()
    
    lazy var presenter: HomePresenter = .init(interactor: HomeInteractor(), view: self)
    private var itemCats: [CatEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubviews(labelTitle,
                              homeTableViewController,
                              indicator)
        setupViews()
        configureUI()
        presenter.viewDidLoad()
    }
    
    private func configureUI() {
        labelTitle.text = "Cat"
        indicator.isHidden = false
    }
    
    private func setupViews() {
        self.view.backgroundColor = .blue
        homeTableViewController.delegate = self
        homeTableViewController.dataSource = self
        setupLayouts()
    }
    
    private func setupLayouts() {
        
        labelTitle.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        homeTableViewController.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(20)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.bottom.equalTo(self.view)
        }
        
        indicator.snp.makeConstraints { make in
//            make.centerX.equalTo(self.view.snp.centerX)
//            make.centerY.equalTo(self.view.snp.centerY)
            make.center.equalTo(self.view.snp.center)
        }
        
    }

}

extension HomeViewController: HomeViewInputs {
    func configure() {
        
    }
    
    func reloadTableView(cats: [CatEntity]) {
        self.itemCats = cats
        DispatchQueue.main.async {
            self.homeTableViewController.reloadData()
        }
    }
    
    func setupTableViewCell() {
        
    }
    
    func indicatorView(animate: Bool) {
        DispatchQueue.main.async {
            animate ? self.indicator.startAnimating() : self.indicator.stopAnimating()
            self.indicator.isHidden = !animate
        }
    }
    
    func sortByTitle() {
        
    }
    
    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(model: itemCats[indexPath.row])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cats \(itemCats[indexPath.row].description ?? "")"
        return cell
    }
    
}
