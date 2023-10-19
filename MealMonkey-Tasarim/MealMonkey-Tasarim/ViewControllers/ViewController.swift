//
//  ViewController.swift
//  MealMonkey-Tasarim
//
//  Created by Mehmet Kaan on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var category: [Category] = []
    var restaurants: [Restaurant] = []
    var popularRestaurants: [Restaurant] = []
    let scrollView = View.scrollView
    let contentView = View.contentView
    let collectionView = View.collectionView
    let label = View.label
    let cartImage = View.cartImage
    let searchBar = View.searchBar
    let currentLocationLabel = View.currentLocationLabel
    let downArrowbutton = View.downArrowbutton
    let deliverLabel = View.deliverLabel
    let popularRestaurantLabel = View.popularRestaurantLabel
    let viewAllButton = View.viewAllButton
    let tableView = View.tableView
    let mostPopularCollectionView = View.mostPopularCollectionView
    let mostPopularLabel = View.mostPopularLabel
    let viewAll = View.viewAllButton2
    let recentItems = View.recentItemsLabel
    let viewButton = View.viewAllButton3
    let recentTableView = View.recentRestaurants
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
        
        let rest1 = Restaurant(image: UIImage(named: "minute")!, name: "Minute by Tuk Tuk")
        let rest2 = Restaurant(image: UIImage(named: "cafe")!, name: "Cafe de Noir")
        let rest3 = Restaurant(image: UIImage(named: "bake")!, name: "Bakes by Tella")
        
        restaurants.append(rest1)
        restaurants.append(rest2)
        restaurants.append(rest3)
        
        
        let cat1 = Category(image: UIImage(named: "offers")!, name: "Offers")
        let cat2 = Category(image: UIImage(named: "sri-lankan")!, name: "Sri Lankan")
        let cat3 = Category(image: UIImage(named: "italian")!, name: "Italian")
        
        category.append(cat1)
        category.append(cat2)
        category.append(cat3)
        
        let rest4 = Restaurant(image: UIImage(named: "bamba")!, name: "Cafe de Bambaa")
        let rest5 = Restaurant(image: UIImage(named: "isso")!, name: "Isso")
        let rest6 = Restaurant(image: UIImage(named: "beans")!, name: "Cafe Beans")
        popularRestaurants.append(rest4)
        popularRestaurants.append(rest5)
        popularRestaurants.append(rest6)
        
    }
    
    private func setup() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(collectionView)
        contentView.addSubview(label)
        contentView.addSubview(cartImage)
        contentView.addSubview(deliverLabel)
        contentView.addSubview(currentLocationLabel)
        contentView.addSubview(downArrowbutton)
        contentView.addSubview(searchBar)
        contentView.addSubview(popularRestaurantLabel)
        contentView.addSubview(viewAllButton)
        contentView.addSubview(tableView)
        contentView.addSubview(mostPopularCollectionView)
        contentView.addSubview(mostPopularLabel)
        contentView.addSubview(viewAll)
        contentView.addSubview(recentItems)
        contentView.addSubview(viewButton)
        contentView.addSubview(recentTableView)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PopularRestaurantCell.self, forCellReuseIdentifier: PopularRestaurantCell.identifier)
        
        recentTableView.delegate = self
        recentTableView.dataSource = self
        recentTableView.register(RecentTableViewCell.self, forCellReuseIdentifier: RecentTableViewCell.identifier)
        
        mostPopularCollectionView.delegate = self
        mostPopularCollectionView.dataSource = self
        mostPopularCollectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
        
        let hConst = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.widthAnchor.constraint(equalToConstant: 250),

            cartImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cartImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cartImage.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            cartImage.heightAnchor.constraint(equalToConstant: 25),
            cartImage.widthAnchor.constraint(equalToConstant: 25),

            deliverLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            deliverLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            currentLocationLabel.topAnchor.constraint(equalTo: deliverLabel.bottomAnchor, constant: 10),
            currentLocationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            downArrowbutton.topAnchor.constraint(equalTo: deliverLabel.bottomAnchor, constant: 10),
            downArrowbutton.leadingAnchor.constraint(equalTo: currentLocationLabel.trailingAnchor, constant: 40),

            searchBar.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 140),

            popularRestaurantLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            popularRestaurantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),

            viewAllButton.leadingAnchor.constraint(equalTo: popularRestaurantLabel.trailingAnchor, constant: 90),
            viewAllButton.topAnchor.constraint(equalTo: popularRestaurantLabel.bottomAnchor, constant: 45),

            tableView.topAnchor.constraint(equalTo: popularRestaurantLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 300),
            
            mostPopularLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            mostPopularLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            mostPopularLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            viewAll.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10),
            viewAll.leadingAnchor.constraint(equalTo: mostPopularLabel.trailingAnchor, constant: 90),
            viewAll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -95),
            

            mostPopularCollectionView.topAnchor.constraint(equalTo: mostPopularLabel.bottomAnchor, constant: 10),
            mostPopularCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mostPopularCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mostPopularCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mostPopularCollectionView.heightAnchor.constraint(equalToConstant: 190),
            
            recentItems.topAnchor.constraint(equalTo: mostPopularCollectionView.bottomAnchor, constant: 30),
            recentItems.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            viewButton.topAnchor.constraint(equalTo: mostPopularCollectionView.bottomAnchor, constant: 30),
            viewButton.leadingAnchor.constraint(equalTo: recentItems.trailingAnchor, constant: 120),
            
            recentTableView.topAnchor.constraint(equalTo: recentItems.bottomAnchor,constant: 10),
            recentTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recentTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recentTableView.heightAnchor.constraint(equalToConstant: 200),
            
            recentTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

#Preview() {
    ViewController()
}
