//
//  ListView.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation
import UIKit

protocol AnyView {
    var presenter : AnyPresenter? {get set}
    
    func update(with list : [Attributes])
    func update(with error : HTTPError)
}

class ListView : UIViewController, AnyView {
    var presenter: AnyPresenter?
    var names = [Attributes]()
    
    private let searchBar : UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 40))
        searchBar.placeholder = "İstediğiniz ismi veya ilk harfini giriniz"
        searchBar.prompt = "İsimler"
        return searchBar
    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.isHidden = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        view.addSubview(tableView)
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func update(with list: [Attributes]) {
        DispatchQueue.main.async {
            self.names = list
            self.tableView.reloadData()
        }
    }
    
    func update(with error: HTTPError) {
            print(error.rawValue)
    }

}
extension ListView : UITableViewDelegate , UITableViewDataSource, UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 1 {
            presenter?.interactor?.fetchData(input: searchText, searchType: .meaning)
        }else {
            presenter?.interactor?.fetchData(input: searchText, searchType: .firstLetter)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if names.isEmpty {
            return 1
        }else {
            return names.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var routerInstance = DetailRouter.viewDidChanged()
        var selectedSlug = names[indexPath.row].slug
        DetailView.selected = selectedSlug
        present(routerInstance.secondView!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        var content = cell.defaultContentConfiguration()
        if !names.isEmpty {
            if let meaning = names[indexPath.row].meaning {
                content.secondaryText = meaning
            }
            content.text = names[indexPath.row].name
        } else {
            content.text = "Bir arama kelimesi girmediniz!".capitalized.uppercased()
        }
        cell.contentConfiguration = content
        return cell
    }
}
