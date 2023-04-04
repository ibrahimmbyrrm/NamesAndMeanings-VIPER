//
//  DetailView.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 4.04.2023.
//

import Foundation
import UIKit

protocol AnyDetailView {
    var presenter : AnyDetailPresenter? {get set}
    func updateUI(name : Attributes)
}

class DetailView : UIViewController, AnyDetailView {
    
    var presenter: AnyDetailPresenter?
    static var selected = ""
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .gray
        return label
    }()
    private let meaningLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .gray
        return label
    }()
    private let genderLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .gray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(nameLabel)
        view.addSubview(meaningLabel)
        view.addSubview(genderLabel)
        presenter?.interactor?.fetchDetails(slug: DetailView.selected)
        setupView()
    }
    func setupView() {
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            
            meaningLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            meaningLabel.heightAnchor.constraint(equalToConstant: 60),
            meaningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meaningLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            
            genderLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            genderLabel.heightAnchor.constraint(equalToConstant: 60),
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: meaningLabel.bottomAnchor, constant: 30)
        ])
    }
    
    func updateUI(name: Attributes) {
        DispatchQueue.main.async {
            self.nameLabel.text = name.name
            self.meaningLabel.text = name.meaning
            self.genderLabel.text = name.gender
        }
    }
    
}
