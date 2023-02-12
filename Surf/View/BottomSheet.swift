//
//  BottomSheet.swift
//  Surf
//
//  Created by Леонид Шелудько on 13.02.2023.
//

import UIKit
import AnchoredBottomSheet

class BottomSheet: NSObject {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BasicCell")
        tableView.register(CarouselTableViewCell.self, forCellReuseIdentifier: CarouselTableViewCell.identifier)
        tableView.register(DobleCollectionTableViewCell.self, forCellReuseIdentifier: DobleCollectionTableViewCell.identifier)
        
        return tableView
    }()
    
}

extension BottomSheet: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         switch indexPath.row {
         case 0:
             let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
             let titleLabel: UILabel = {
                 let label = UILabel()
                 label.text = "Стажировка в Surf"
                 label.font = .boldSystemFont(ofSize: 22)
                 label.textColor = .black
                 label.translatesAutoresizingMaskIntoConstraints = false
                 return label
             }()
             cell.contentView.addSubview(titleLabel)
             NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: cell.topAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
             ])
             return cell
             
         case 1:
             let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
             let goWorkLabel: UILabel = {
                 let label = UILabel()
                 label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты"
                 label.numberOfLines = 0
                 label.font = .systemFont(ofSize: 15)
                 label.textColor = .gray
                 label.translatesAutoresizingMaskIntoConstraints = false
                 return label
             }()
             cell.contentView.addSubview(goWorkLabel)
             
             NSLayoutConstraint.activate([
                goWorkLabel.topAnchor.constraint(equalTo: cell.topAnchor),
                goWorkLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                goWorkLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
                goWorkLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
             ])
             
             return cell
             
         case 2:
             let cell = tableView.dequeueReusableCell(withIdentifier: CarouselTableViewCell.identifier, for: indexPath) as! CarouselTableViewCell
             return cell
             
         case 3:
             let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
             let goWorkLabel: UILabel = {
                 let label = UILabel()
                 label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе"
                 label.numberOfLines = 0
                 label.font = .systemFont(ofSize: 15)
                 label.textColor = .gray
                 label.translatesAutoresizingMaskIntoConstraints = false
                 return label
             }()
             cell.contentView.addSubview(goWorkLabel)
             
             NSLayoutConstraint.activate([
                goWorkLabel.topAnchor.constraint(equalTo: cell.topAnchor),
                goWorkLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                goWorkLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
                goWorkLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
             ])
             return cell
             
         case 4:
             let cell = tableView.dequeueReusableCell(withIdentifier: DobleCollectionTableViewCell.identifier, for: indexPath) as! DobleCollectionTableViewCell
             return cell
         default:
             return UITableViewCell()
         }
    }
}

extension BottomSheet: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1:
            return 70
        case 2:
            return 90
        case 4:
            return 140
        default:
            return 40
        }
    }
    

}
