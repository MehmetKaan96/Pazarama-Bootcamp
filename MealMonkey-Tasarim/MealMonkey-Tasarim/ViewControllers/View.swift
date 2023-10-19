//
//  View.swift
//  MealMonkey-Tasarim
//
//  Created by Mehmet Kaan on 18.10.2023.
//

import Foundation
import UIKit

class View {
    static let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let mostPopularCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20)
        layout.minimumLineSpacing = 100
        layout.itemSize = CGSize(width: 230, height: 190)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    static let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20)
        layout.minimumLineSpacing = 25
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    static let label: UILabel = {
        let label = UILabel()
        label.text = "Good Morning Mehmet!"
        label.textAlignment = .natural
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    static let cartImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "cart.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = .darkGray
        return iv
    }()
    
    static let deliverLabel: UILabel = {
       let label = UILabel()
        label.text = "Delivering to"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let currentLocationLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Location"
        label.font =  .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
    }()
    
    static let downArrowbutton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .orange
        return button
    }()
    
    static let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Search food"
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.sizeToFit()
        bar.searchBarStyle = .minimal
        return bar
    }()
    
    static let popularRestaurantLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Restaurants"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let viewAllButton: UIButton = {
       let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.tintColor = .orange
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    static let mostPopularLabel: UILabel = {
       let label = UILabel()
        label.text = "Most Popular"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    static let viewAllButton2: UIButton = {
       let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.tintColor = .orange
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let recentItemsLabel: UILabel = {
       let label = UILabel()
        label.text = "Recent Items"
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        return label
    }()
    
    static let viewAllButton3: UIButton = {
       let button = UIButton()
        button.setTitle("View all", for: .normal)
        button.tintColor = .orange
        button.configuration = .plain()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    static let recentRestaurants: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
}
