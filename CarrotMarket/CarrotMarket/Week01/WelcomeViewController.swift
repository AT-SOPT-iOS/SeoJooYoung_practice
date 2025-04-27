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
        let image = UIImageView(frame: CGRect(x: 120, y: 112, width: 150, height: 150))
        image.image = .welcome
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 295, width: 95, height: 60))
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .pretendard(size: 25, weight: .extraBold)
        return label
    }()
    
    private lazy var mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 426, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendard(size: 18, weight: .bold)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .pretendard(size: 18, weight: .bold)
        button.addTarget(self, action: #selector(backToLoginButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.setLayout()
        
        bindID()
    }
    
    private func setLayout() {
        [imageView, welcomeLabel, mainButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func bindID() {
        if let id = id {
            self.welcomeLabel.text = "\(id == "" ? "???" : id)님\n반가워요!"
        }
    }
    
    @objc
    private func backToLoginButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}

