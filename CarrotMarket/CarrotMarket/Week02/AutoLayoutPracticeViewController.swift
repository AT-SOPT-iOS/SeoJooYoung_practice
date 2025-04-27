//
//  AutoLayoutPracticeViewController.swift
//  CarrotMarket
//
//  Created by seozero on 4/12/25.
//

import UIKit

class AutoLayoutPracticeViewController: UIViewController {
    var firstRect: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var secondRect: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var thirdRect: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var fourthRect: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        let rectWidth = UIScreen.main.bounds.width / 2
        let rectHeight = UIScreen.main.bounds.height / 4
        
        [firstRect, secondRect, thirdRect, fourthRect].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([firstRect.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     firstRect.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     firstRect.widthAnchor.constraint(equalToConstant: rectWidth),
                                     firstRect.heightAnchor.constraint(equalToConstant: rectHeight)
                                    ])
        
        NSLayoutConstraint.activate([secondRect.topAnchor.constraint(equalTo: self.firstRect.bottomAnchor),
                                     secondRect.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     secondRect.widthAnchor.constraint(equalToConstant: rectWidth),
                                     secondRect.heightAnchor.constraint(equalToConstant: rectHeight)
                                    ])
        
        NSLayoutConstraint.activate([thirdRect.topAnchor.constraint(equalTo: self.secondRect.bottomAnchor),
                                     thirdRect.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     thirdRect.widthAnchor.constraint(equalToConstant: rectWidth),
                                     thirdRect.heightAnchor.constraint(equalToConstant: rectHeight)
                                    ])
        
        NSLayoutConstraint.activate([fourthRect.topAnchor.constraint(equalTo: self.thirdRect.bottomAnchor),
                                     fourthRect.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     fourthRect.widthAnchor.constraint(equalToConstant: rectWidth),
                                     fourthRect.heightAnchor.constraint(equalToConstant: rectHeight)
                                    ])
    }
}
