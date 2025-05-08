//
//  LoginViewController_server.swift
//  CarrotMarket
//
//  Created by seozero on 5/9/25.
//

import UIKit

import SnapKit
import Then


final class LoginViewController_server: UIViewController {
    
    private var loginId: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    private let stackView = UIStackView()
    private lazy var idTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    private lazy var registerButton = UIButton()
    private lazy var infoViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
        
        stackView.do {
            [idTextField, passwordTextField, loginButton, registerButton, infoViewButton].forEach {
                stackView.addArrangedSubview($0)
            }
            
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.spacing = 20
        }
        
        idTextField.do {
            $0.backgroundColor = .lightGray
            $0.placeholder = "아이디를 입력하슈"
        }
        
        passwordTextField.do {
            $0.backgroundColor = .lightGray
            $0.placeholder = "패스워드를 입력하슈"
        }
        
        loginButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("로그인", for: .normal)
            $0.titleLabel?.textColor = .white
        }
        
        registerButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("회원가입", for: .normal)
            $0.titleLabel?.textColor = .white
        }
        
        infoViewButton.do {
            $0.backgroundColor = .blue
            $0.setTitle("회원정보 조회", for: .normal)
            $0.titleLabel?.textColor = .white
        }
        
    }
    
    private func setHierarchy() {
        self.view.addSubview(stackView)

    }
    
    private func setLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
    }
    
    private func setAddTarget() {
        idTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        passwordTextField.addTarget(self, action: #selector(textFieldDidEditing(_:)), for: .allEvents)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        infoViewButton.addTarget(self, action: #selector(infoViewButtonTapped), for: .touchUpInside)

    }
    
    @objc
    private func infoViewButtonTapped() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }
    
    @objc
    private func registerButtonTapped() {
        let registerVC = RegisterViewController()
        self.present(registerVC, animated: true)
    }
    
    
    @objc
    private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            loginId = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }
    
    @objc
    private func loginButtonTapped() {
        Task {
            do {
                let response = try await LoginService.shared.postLoginData(loginId: self.loginId, password: self.password)
                
                let alert = UIAlertController(
                    title: "로그인 성공",
                    message: "환영합니다! (userId: \(response.userId))",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
            } catch {
                let alert = UIAlertController(
                    title: "로그인 실패",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
                
                print("로그인 에러:", error)
            }
        }
    }
}
