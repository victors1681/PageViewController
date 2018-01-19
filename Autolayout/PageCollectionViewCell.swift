//
//  PageCollectionViewCell.swift
//  Autolayout
//
//  Created by Victor Santos on 1/19/18.
//  Copyright © 2018 itsoluclick. All rights reserved.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let uPage = page else {
                return
            }
            rocketImageView.image = UIImage(named: (uPage.imageName))
            
            
            let attributedText = NSMutableAttributedString(string:uPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSMutableAttributedString(string: uPage.bodyText, attributes:[ NSAttributedStringKey.font  : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "space1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
         
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
      
    }
    
   private func setupLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        //topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(rocketImageView)
        rocketImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        rocketImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        rocketImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        //rocketImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor).isActive = true
        //rocketImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rocketImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
        
    }

    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error")
    }
}

