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
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpConstraints()
    }
    
    func setUpConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        self.callAlert(title: "HATA", message: error.rawValue)
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
        if !names.isEmpty {
            DetailView.selected = names[indexPath.row].slug
            present(DetailRouter.viewDidChanged().secondView!, animated: true)
        }else {
            self.callAlert(title: "HATA", message: "Bir isim seçmelisiniz")
        }
       
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
            content.text = "Bir arama kelimesi girmelisiniz!".capitalized.uppercased()
        }
        cell.contentConfiguration = content
        return cell
    }
}
