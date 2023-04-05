//
//  UILabel+Configure.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 5.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    func configureInformationLabels() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.textColor = .black
        self.backgroundColor = .gray
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.font = self.font.withSize(20)
        self.numberOfLines = 0
    }
    
    func configureTitleLabel() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
        self.textColor = .brown
        self.text = "Seçilen İsmin Detayları"
        self.font = self.font.withSize(35)
    }
}
