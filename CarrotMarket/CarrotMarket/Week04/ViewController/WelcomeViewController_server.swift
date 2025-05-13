//
//  WelcomeViewController_server.swift
//  CarrotMarket
//
//  Created by seozero on 5/9/25.
//

import UIKit
import SnapKit
import Then

final class WelcomeViewController_server: UIViewController {

    private let nickname: String
    private var userId: Int

    init(nickname: String, userId: Int) {
        self.nickname = nickname
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let welcomeLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        $0.textAlignment = .center
    }

    private let changeNicknameButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("닉네임 변경", for: .normal)
        $0.setTitleColor(.white, for: .normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setStyle()
        setHierarchy()
        setLayout()
        setAddTarget()
    }

    private func setStyle() {
        welcomeLabel.text = "환영합니다, \(nickname)님!"
    }

    private func setHierarchy() {
        view.addSubview(welcomeLabel)
        view.addSubview(changeNicknameButton)
    }

    private func setLayout() {
        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
        }

        changeNicknameButton.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(120)
        }
    }

    private func setAddTarget() {
        changeNicknameButton.addTarget(self, action: #selector(changeNicknameButtonTapped), for: .touchUpInside)
    }

    @objc
    private func changeNicknameButtonTapped() {
        let changeNicknameVC = ChangeNickNameViewController(userId: userId)
        self.present(changeNicknameVC, animated: true)
    }
}
