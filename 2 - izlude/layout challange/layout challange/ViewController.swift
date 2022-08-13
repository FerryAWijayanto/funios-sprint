//
//  ViewController.swift
//  layout challange
//
//  Created by Fahri Novaldi on 12/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }

    private func setupView(){
        let header = UIImageView(image: UIImage(named: "header"))
        view.addSubview(header)
        
        // Ini bisa di refactor biar ngga ada pengulangan
        // Bikin extension buat pin layout
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: header, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: header, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: header, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: header, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 0.5, constant: 0)
        ])
        
        // UIlabel yang sering ada pengulangan mending di jadiin default value yg sering di pake, contoh numberOfLines dll.
        let title = UILabel()
        title.text = "Let's Connect with each Other"
        title.numberOfLines = 0
        title.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .headline), size: 36)
        title.textColor = .black
        title.textAlignment = .center
        view.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: title, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: title, attribute: .top, relatedBy: .equal, toItem: header, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: title, attribute: .width, relatedBy: .lessThanOrEqual, toItem: view, attribute: .width, multiplier: 1, constant: -20)
        ])
        
        let subtitle = UILabel()
        subtitle.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"
        subtitle.numberOfLines = 0
        subtitle.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .subheadline), size: 20)
        subtitle.textColor = .systemGray
        subtitle.textAlignment = .center
        view.addSubview(subtitle)
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: subtitle, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: subtitle, attribute: .top, relatedBy: .equal, toItem: title, attribute: .bottom, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: subtitle, attribute: .width, relatedBy: .lessThanOrEqual, toItem: view, attribute: .width, multiplier: 1, constant: -20)
        ])
        
        
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.applyGradient(with: [
            UIColor.green.cgColor,
            UIColor.yellow.cgColor
        ], start: CGPoint(x: 0, y: 0.5),
                             to: CGPoint(x: 0.5, y: 0))
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 16
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20),
            NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -20),
            NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -15),
            NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
        ])
    }

}

