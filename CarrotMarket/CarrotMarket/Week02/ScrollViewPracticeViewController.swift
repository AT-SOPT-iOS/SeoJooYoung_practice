//
//  ScrollViewPracticeViewController.swift
//  CarrotMarket
//
//  Created by seozero on 4/12/25.
//

import UIKit

class ScrollViewPracticeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView()
    private let orangeView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blueView = UIView()
    private let purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        
    }
    
    private func setLayout() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
        
        let contentWidth = UIScreen.main.bounds.width / 2
        
        let heightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: contentView.topAnchor),
            redView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            redView.widthAnchor.constraint(equalToConstant: contentWidth),
            redView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            orangeView.topAnchor.constraint(equalTo: contentView.topAnchor),
            orangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            orangeView.widthAnchor.constraint(equalToConstant: contentWidth),
            orangeView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor),
            yellowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            yellowView.widthAnchor.constraint(equalToConstant: contentWidth),
            yellowView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            greenView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            greenView.widthAnchor.constraint(equalToConstant: contentWidth),
            greenView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            blueView.widthAnchor.constraint(equalToConstant: contentWidth),
            blueView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            purpleView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            purpleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            purpleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            purpleView.widthAnchor.constraint(equalToConstant: contentWidth),
            purpleView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
