//
//  CarouselTableViewCell.swift
//  buttonSheet
//
//  Created by Леонид Шелудько on 12.02.2023.
//

import UIKit

class CarouselTableViewCell: UITableViewCell {
    
    static var identifier = "SimpleTableViewCell"
    
    var collectionView: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var professionArray = Proffesions.proffesion
    private var selectedIndex = Int()
    
    private var touchCell = false
    private var repeatCell = 0

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
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

    }

}


extension CarouselTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return professionArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCollectionViewCell", for: indexPath) as! CarouselCollectionViewCell
        cell.textLabel.text = professionArray[indexPath.row]
        
        if touchCell == false || repeatCell == 2 {  //если 2 нажатия, то убирает цвет.
            cell.contentView.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9529411765, alpha: 1)
        } else {
            cell.contentView.backgroundColor = selectedIndex == indexPath.row ? UIColor.lightGray : #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9529411765, alpha: 1)
        }

        return cell
    }
}

extension CarouselTableViewCell: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        touchCell = true
        if selectedIndex == indexPath.row && repeatCell < 2 {
            repeatCell += 1
        } else {
            repeatCell = 1
        }
        selectedIndex = indexPath.row
        
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        
        self.collectionView.reloadData()
    }
    
}

extension CarouselTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel(frame: CGRect.zero)
        label.text = professionArray[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width + 50, height: 50)
    }

    //Когда повявляется, отступ в начале
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    //Расстояние между ячейками
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
