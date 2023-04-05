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
        label.configureInformationLabels()
        return label
    }()
    
    private let meaningLabel : UILabel = {
        let label = UILabel()
        label.configureInformationLabels()
        return label
    }()
    
    private let genderLabel : UILabel = {
       let label = UILabel()
        label.configureInformationLabels()
        return label
    }()
    
    private let originLabel : UILabel = {
        let label = UILabel()
        label.configureInformationLabels()
         return label
    }()
    
    private let kuranLabel : UILabel = {
       let label = UILabel()
        label.configureInformationLabels()
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.configureTitleLabel()
         return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(meaningLabel)
        view.addSubview(genderLabel)
        view.addSubview(kuranLabel)
        view.addSubview(originLabel)
        view.addSubview(titleLabel)
        presenter?.interactor?.fetchDetails(slug: DetailView.selected)
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .black
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            nameLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            nameLabel.heightAnchor.constraint(equalToConstant: 80),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            
            meaningLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            meaningLabel.heightAnchor.constraint(equalToConstant: 80),
            meaningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            meaningLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30),
            
            genderLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            genderLabel.heightAnchor.constraint(equalToConstant: 80),
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderLabel.topAnchor.constraint(equalTo: meaningLabel.bottomAnchor, constant: 30),
            
            kuranLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            kuranLabel.heightAnchor.constraint(equalToConstant: 80),
            kuranLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kuranLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 30),
            
            originLabel.widthAnchor.constraint(equalToConstant: view.bounds.width),
            originLabel.heightAnchor.constraint(equalToConstant: 80),
            originLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            originLabel.topAnchor.constraint(equalTo: kuranLabel.bottomAnchor, constant: 30)
        ])
    }
    
    func updateUI(name: Attributes) {
        DispatchQueue.main.async {
            self.nameLabel.text = "İsim : \(name.name)"
            self.meaningLabel.text = "Anlamları : \(name.meaning!)"
            self.genderLabel.text = "Cinsiyet : \(name.gender!)"
            self.originLabel.text = "Köken : \(name.origin!)"
            if name.kuran! {
                self.kuranLabel.text = "Kuranda Geçiyor"
            }else {
                self.kuranLabel.text = "Kuranda Geçmiyor"
            }
        }
    }
    
}
