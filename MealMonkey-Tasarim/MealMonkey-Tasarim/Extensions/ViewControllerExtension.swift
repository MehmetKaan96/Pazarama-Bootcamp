//
//  ViewControllerExtension.swift
//  MealMonkey-Tasarim
//
//  Created by Mehmet Kaan on 18.10.2023.
//

import Foundation
import UIKit

//MARK: - CollectionViewDelegate & Data Source
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mostPopularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            cell.configure(with: popularRestaurants[indexPath.row].image, and: popularRestaurants[indexPath.row].name)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
            cell.configure(with: category[indexPath.row].image, and: category[indexPath.row].name)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 140)
    }
}


//MARK: - TableViewDelegate & Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularRestaurantCell.identifier, for: indexPath) as! PopularRestaurantCell
            cell.configure(with: restaurants[indexPath.row].image, and: restaurants[indexPath.row].name)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentTableViewCell.identifier, for: indexPath) as! RecentTableViewCell
            cell.configure(with: restaurants[indexPath.row].image, and: restaurants[indexPath.row].name)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == self.tableView {
            return 300
        }
        return 150
    }
}
