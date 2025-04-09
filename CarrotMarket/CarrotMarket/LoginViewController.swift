//
//  LoginController.swift
//  CarrotMarket
//
//  Created by seozero on 4/9/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 34, y: 276, width: 335, height: 52))
        textfield.placeholder = "아이디"
        textfield.font = .systemFont(ofSize: 14)
        textfield.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textfield
    }()
    
    private let pwTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 34, y: 335, width: 335, height: 52))
        textfield.placeholder = "비밀번호"
        textfield.font = .systemFont(ofSize: 14)
        textfield.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textfield
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 34, y: 422, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, pwTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }


}
