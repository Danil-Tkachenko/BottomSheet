//
//  DobleCollectionTableViewCell.swift
//  buttonSheet
//
//  Created by Леонид Шелудько on 12.02.2023.
//

import UIKit

class DobleCollectionTableViewCell: UITableViewCell {
    
    static var identifier = "DobleCollectionTableViewCell"
    
    var collectionView: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .horizontal
        

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let pofessionArray = Proffesions.proffesion


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: "CarouselCollectionViewCell")
        
        self.contentView.addSubview(collectionView)

    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

    }

}

extension DobleCollectionTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pofessionArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        cell.textLabel.text = pofessionArray[indexPath.row]
        cell.contentView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9529411765, alpha: 1)
        return cell
    }
}

extension DobleCollectionTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = pofessionArray[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 50, height: 50)
    }

    //Когда повявляется, отступ в начале
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    //Расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}
