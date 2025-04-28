//
//  ItemViewController.swift
//  CarrotMarket
//
//  Created by seozero on 4/26/25.
//

import UIKit

class ItemViewController: UIViewController {
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    
    private let headerStackView = UIStackView()
    
    private let headerTownLabel: UILabel = {
        let label = UILabel()
        label.text = "군자동"
        label.textColor = .black
        label.font = .pretendard(size: 18, weight: .bold)
        return label
    }()
    
    private let headerButtonStackView = UIStackView()
    
    private let headerSearchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let headerMenuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let headerNotiButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let itemData = ItemModel.dummy()
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
        register()
        setCollectionViewLayout()
        
    }
    
    private func setLayout() {
        self.view.addSubview(headerStackView)
        headerStackView.addSubview(headerTownLabel)
        headerStackView.addSubview(headerButtonStackView)
        [headerSearchButton, headerMenuButton, headerNotiButton].forEach {
            headerButtonStackView.addSubview($0)
//            $0.snp.makeConstraints { make in
//                make.width.height.equalTo(24)
//            }
        }
        self.view.addSubview(collectionView)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        headerTownLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        headerButtonStackView.snp.makeConstraints { $0.top.bottom.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(104)
        }
        
        headerSearchButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.leading.equalToSuperview()
        }
        
        headerMenuButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.leading.equalTo(headerSearchButton.snp.trailing).offset(16)
        }
        
        headerNotiButton.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.leading.equalTo(headerMenuButton.snp.trailing).offset(16)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
    }
    
    private func register() {
        collectionView.register(
            ItemCollectionViewCell.self,
            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
        )
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        let cellWidth = doubleCellWidth / 2
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = carrotLineSpacing
        flowLayout.minimumInteritemSpacing = carrotInterItemSpacing
        flowLayout.sectionInset = carrotInset
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func calculateCellHeight() -> CGFloat {
            let count = CGFloat(itemData.count)
            let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
        }
}

extension ItemViewController: UICollectionViewDelegate {
    
}
extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item])
        return cell
    }
}
//
//extension ItemViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let screenWidth = UIScreen.main.bounds.width
//        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
//        return CGSize(width: doubleCellWidth / 2, height: 198)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return carrotLineSpacing
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return carrotInterItemSpacing
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return carrotInset
//    }
//}
//

#Preview {
    ItemViewController()
}
