//
//  WelcomeViewController.swift
//  CarrotMarket
//
//  Created by seozero on 4/9/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String?
    
    private let imageView: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 87, y: 112, width: 150, height: 150))
        image.image = .welcome
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 295, y: 140, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setLayout()
    }
    
    private func setLayout() {
        [imageView, welcomeLabel, mainButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
}

