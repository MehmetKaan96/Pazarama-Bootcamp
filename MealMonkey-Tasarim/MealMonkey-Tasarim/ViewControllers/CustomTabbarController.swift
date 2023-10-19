//
//  CustomTabbarController.swift
//  MealMonkey-Tasarim
//
//  Created by Mehmet Kaan on 19.10.2023.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    let image: UIImageView = {
        let image = UIImageView()
        if let homeImage = UIImage(named: "home") {
            let scaledImage = homeImage.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
            image.image = scaledImage
        }
        image.tintColor = .white
        return image
    }()
    
    let btnMiddle : UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.layer.cornerRadius = 30
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.2
        btn.backgroundColor = .orange
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSomeTabItems()
        image.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 25, y: -25, width: 50, height: 50)
        btnMiddle.frame = CGRect(x: Int(self.tabBar.bounds.width)/2 - 35, y: -30, width: 70, height: 70)
    }
    override func loadView() {
        super.loadView()
        self.tabBar.addSubview(btnMiddle)
        self.tabBar.addSubview(image)
        setupCustomTabBar()
        addSomeTabItems()
    }
    
    func setupCustomTabBar() {
        let path : UIBezierPath = getPathForTabBar()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3
        shape.strokeColor = UIColor.white.cgColor
        shape.fillColor = UIColor.white.cgColor
        self.tabBar.layer.insertSublayer(shape, at: 0)
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowOpacity = 0.5
        self.tabBar.layer.shadowRadius = 5
        self.tabBar.itemWidth = 50
        self.tabBar.itemPositioning = .centered
        self.tabBar.itemSpacing = 190
        self.tabBar.tintColor = .systemGray3
        self.tabBar.unselectedItemTintColor = .systemGray3
    }
    
    func addSomeTabItems() {
        let vc1 = UINavigationController(rootViewController: ViewController())
        let vc2 = UINavigationController(rootViewController: ViewController())
        let vc3 = UINavigationController(rootViewController: ViewController())
        let vc4 = UINavigationController(rootViewController: ViewController())
        vc1.title = "Menu"
        vc2.title = "Offers"
        vc3.title = "Profile"
        vc4.title = "More"
        setViewControllers([vc1, vc2, vc3, vc4], animated: false)
        guard let items = tabBar.items else { return}
        items[0].image = UIImage(named: "menu")
        items[1].image = UIImage(named: "bag")
        items[2].image = UIImage(systemName: "person.fill")
        items[3].image = UIImage(named: "more")
    }
    
    func getPathForTabBar() -> UIBezierPath {
        let frameWidth = self.tabBar.bounds.width
        let frameHeight = self.tabBar.bounds.height + 20
        let holeWidth = 150
        let holeHeight = 50
        let leftXUntilHole = Int(frameWidth/2) - Int(holeWidth/2)
        
        let path : UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: leftXUntilHole , y: 0))
        path.addCurve(to: CGPoint(x: leftXUntilHole + (holeWidth/3), y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*6,y: 0), controlPoint2: CGPoint(x: leftXUntilHole + ((holeWidth/3)/8)*8, y: holeHeight/2))
        path.addCurve(to: CGPoint(x: leftXUntilHole + (2*holeWidth)/3, y: holeHeight/2), controlPoint1: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2/5, y: (holeHeight/2)*6/4), controlPoint2: CGPoint(x: leftXUntilHole + (holeWidth/3) + (holeWidth/3)/3*2 + (holeWidth/3)/3*3/5, y: (holeHeight/2)*6/4))
        path.addCurve(to: CGPoint(x: leftXUntilHole + holeWidth, y: 0), controlPoint1: CGPoint(x: leftXUntilHole + (2*holeWidth)/3,y: holeHeight/2), controlPoint2: CGPoint(x: leftXUntilHole + (2*holeWidth)/3 + (holeWidth/3)*2/8, y: 0))
        path.addLine(to: CGPoint(x: frameWidth, y: 0))
        path.addLine(to: CGPoint(x: frameWidth, y: frameHeight))
        path.addLine(to: CGPoint(x: 0, y: frameHeight))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        return path
    }
}

#Preview() {
    CustomTabbarController()
}
