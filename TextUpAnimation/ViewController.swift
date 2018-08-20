//
//  ViewController.swift
//  TextUpAnimation
//
//  Created by OlehMalichenko on 30.07.2018.
//  Copyright © 2018 OlehMalichenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let headLabel = UILabel()
    let bodyLabel = UILabel()
    let hotImageView = UIImageView(image: #imageLiteral(resourceName: "HotTap"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupStackView()
        setupHotImageView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapGasture)))
    }
    
    fileprivate func setupLabels() {
        headLabel.numberOfLines = 0
        headLabel.font = UIFont(name: "Futura", size: 34)
        headLabel.text = "Welcome to company XYZ!"
        bodyLabel.numberOfLines = 0
        bodyLabel.font = UIFont(name: "Futura", size: 15)
        bodyLabel.text = "Let's learn how to chain animations together in today's lesson to achieve some stunning visual effects.  Nothing too hard, but you need to make sure you don't overdo it with animations.  Have fun."
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [headLabel, bodyLabel])
        self.view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    fileprivate func setupHotImageView() {
        view.addSubview(hotImageView)
        hotImageView.translatesAutoresizingMaskIntoConstraints = false
        hotImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        hotImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        hotImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        hotImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc fileprivate func handleTapGasture() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.hotImageView.transform = CGAffineTransform(rotationAngle: 200)
            self.headLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.headLabel.alpha = 0
                self.headLabel.transform = self.headLabel.transform.translatedBy(x: 0, y: -200)
                self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                self.hotImageView.transform = self.hotImageView.transform.rotated(by: -100)
            })
            UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -400)
                self.hotImageView.transform = self.hotImageView.transform.rotated(by: -100)
            })
            
        }
    }
}









