//
//  LoginViewController_DelegatePattern.swift
//  CarrotMarket
//
//  Created by seozero on 4/12/25.
//

import UIKit

final class LoginViewController_DelegatePattern: UIViewController, DataBindDelegate {
    
    func dataBind(id: String) {
        pwTextField.text = id
    }
    
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 76, y: 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .pretendard(size: 18, weight: .bold)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 30, y: 276, width: 335, height: 52))
        textfield.placeholder = "아이디"
        textfield.font = .pretendard(size: 14, weight: .semiBold)
        textfield.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textfield.layer.cornerRadius = 3
        textfield.setLeftView(width: 23)
        
        return textfield
    }()
    
    private let pwTextField: UITextField = {
        let textfield = UITextField(frame: CGRect(x: 30, y: 335, width: 335, height: 52))
        textfield.placeholder = "비밀번호"
        textfield.font = .pretendard(size: 14, weight: .semiBold)
        textfield.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textfield.layer.cornerRadius = 3
        textfield.setLeftView(width: 23)
        
        return textfield
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 422, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .pretendard(size: 18, weight: .bold)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 6
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

    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.id = idTextField.text
        self.present(welcomeVC, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.delegate = self
        welcomeVC.id = idTextField.text
        self.navigationController?.pushViewController(welcomeVC, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc
    private func loginButtonTapped() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }

}

private extension UITextField {
    func setLeftView(width: CGFloat) {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 52))
        self.leftView = leftPaddingView
        self.leftViewMode = .always
    }
}
