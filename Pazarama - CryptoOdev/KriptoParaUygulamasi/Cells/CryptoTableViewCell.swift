//
//  CryptoTableViewCell.swift
//  KriptoParaUygulamasi
//
//  Created by Mehmet Kaan on 21.10.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    static let identifier = "CryptoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        self.layer.cornerRadius = 10
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupViews()
        }
    
    private let ImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "coloncurrencysign.circle")
        iv.tintColor = .label
        iv.layer.borderWidth = 1
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let currencyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGray4
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cafe  Western Food"
        return label
    }()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with name: String, and price: String) {
        self.currencyNameLabel.text = name
        self.priceLabel.text = price
    }
    
    private func setupViews() {
        contentView.addSubview(ImageView)
        contentView.addSubview(currencyNameLabel)
        contentView.addSubview(priceLabel)
        
        ImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ImageView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width / 3),
            ImageView.heightAnchor.constraint(equalToConstant: 100),
            
            currencyNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            currencyNameLabel.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor,constant: 30),
            
            priceLabel.topAnchor.constraint(equalTo: currencyNameLabel.bottomAnchor, constant: 10),
            priceLabel.leadingAnchor.constraint(equalTo: ImageView.trailingAnchor, constant: 30)
            
        ])
        }


}

#Preview() {
    CryptoTableViewCell()
}
