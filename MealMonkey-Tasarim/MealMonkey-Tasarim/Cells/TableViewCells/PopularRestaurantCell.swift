//
//  PopularRestaurantCell.swift
//  MealMonkey-Tasarim
//
//  Created by Mehmet Kaan on 18.10.2023.
//

import UIKit

class PopularRestaurantCell: UITableViewCell {

    static let identifier = "PopularRestaurantCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
    
    private let restaurantImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "house.fill")
        iv.tintColor = .label
        iv.layer.borderWidth = 1
        return iv
    }()
    
    private let restaurantLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        iv.tintColor = .orange
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let averageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "4.9"
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(124 ratings) Cafe  Western Food"
        return label
    }()
    
    func configure(with image: UIImage, and name: String) {
        self.restaurantImageView.image = image
        self.restaurantLabel.text = name
    }
    
    private func setupViews() {
        contentView.addSubview(restaurantImageView)
        contentView.addSubview(starImage)
        contentView.addSubview(restaurantLabel)
        contentView.addSubview(averageLabel)
        contentView.addSubview(infoLabel)
        
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            restaurantImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 190),
            restaurantImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width),
            
            restaurantLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 10),
            restaurantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            
            starImage.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 10),
            starImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            averageLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor,constant: 10),
            averageLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 10),
            
            infoLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: averageLabel.trailingAnchor)
            
        ])
        }

}
