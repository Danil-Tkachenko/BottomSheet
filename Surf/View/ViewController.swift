//
//  ViewController.swift
//  Surf
//
//  Created by Леонид Шелудько on 12.02.2023.
//

import UIKit
import AnchoredBottomSheet


class ViewController: UIViewController {

    private let presentView = BottomSheet()
    
    private let viewBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "surfImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let viewFooter: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var wantLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.textColor = .gray
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var sendRequestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.frame.origin.y = -150
        presentModalWithTableView()
    }
    
    private func setView() {
        
        viewBackground.frame = CGRect(x: 0, y: 150, width: view.bounds.width, height: view.bounds.height)
        viewFooter.frame = CGRect(x: 0, y: view.frame.size.height - 20, width: view.bounds.width, height: 170)
        
        view.addSubview(viewBackground)
        view.addSubview(viewFooter)
        viewFooter.addSubview(wantLabel)
        viewFooter.addSubview(sendRequestButton)
    }
    
    private func presentModalWithTableView() {
        
        let configuration = BottomSheetViewConfiguration(
            contentView: presentView.tableView,
            parentViewController: self,
            defaultPosition: .bottom(height: view.bounds.height / 4),
            positions: [.middle(height: view.bounds.height / 2), .top(height: view.bounds.height / 1.4), .bottom(height: view.bounds.height / 4)],
            isPullIndicatorNeeded: false,
            isDismissAllowed: false,
            cornerRadius: 20
        )
        let bottomSheetView = BottomSheetView(configuration: configuration)
        let bottomSheetViewController = BottomSheetViewController(bottomSheetView: bottomSheetView)

        bottomSheetViewController.present(from: self)
    }
    
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            wantLabel.centerYAnchor.constraint(equalTo: viewFooter.centerYAnchor),
            wantLabel.leadingAnchor.constraint(equalTo: viewFooter.leadingAnchor, constant: 20),
            wantLabel.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            sendRequestButton.centerYAnchor.constraint(equalTo: viewFooter.centerYAnchor),
            sendRequestButton.leadingAnchor.constraint(equalTo: wantLabel.trailingAnchor, constant: 10),
            sendRequestButton.trailingAnchor.constraint(equalTo: viewFooter.trailingAnchor, constant: -20),
            sendRequestButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
