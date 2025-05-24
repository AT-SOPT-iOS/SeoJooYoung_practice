//
//  ChangeNickNameViewController.swift
//  CarrotMarket
//
//  Created by seozero on 5/9/25.
//

import UIKit

import SnapKit
import Then


final class ChangeNickNameViewController: UIViewController {
    
    private var newNickname: String = ""
    private var userId: Int
    
    init(userId: Int) {
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nicknameTextField = UITextField().then {
        $0.placeholder = "새 닉네임을 입력하세요"
        $0.borderStyle = .roundedRect
    }
    
    private let updateButton = UIButton().then {
        $0.setTitle("닉네임 수정", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    private func setHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(updateButton)
    }
    
    private func setLayout() {
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(44)
        }
        
        updateButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(44)
        }
    }
    
    private func setAddTarget() {
        nicknameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldDidChange(_ sender: UITextField) {
        newNickname = sender.text ?? ""
    }
    
    @objc private func updateButtonTapped() {
        Task {
            do {
                try await UserService.shared.patchNickname(to: newNickname, userId: userId)
                showAlert(title: "성공", message: "닉네임이 수정되었습니다.")
            } catch {
                showAlert(title: "에러", message: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
