//
//  VC+Alert.swift
//  NamesAndMeanings
//
//  Created by İbrahim Bayram on 5.04.2023.
//
import UIKit
import Foundation

extension UIViewController {
    func callAlert(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
