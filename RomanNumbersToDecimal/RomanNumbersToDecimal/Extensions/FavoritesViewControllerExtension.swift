//
//  FavoritesViewControllerExtension.swift
//  RomanNumbersToDecimal
//
//  Created by Mehmet Kaan on 14.10.2023.
//

import Foundation
import UIKit


//MARK: - TableView Protocols
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(keyArray[indexPath.row] )  \(valueArray[indexPath.row])"
        
        return cell
    }
}
