//
//  SwipeController.swift
//  Autolayout
//
//  Created by Victor Santos on 1/19/18.
//  Copyright © 2018 itsoluclick. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/225, green: 68/255, blue: 133/25, alpha: 1.0)
}

class SwipeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
 
    let pages: [Page] = [
        Page(imageName: "space1", headerText: "Rockets are fun!", bodyText: "\n\n\nThe first known rockets were used in China in the 1200s. These solid rockets were used for fireworks. They also were used by armies for war. In the 1300s, these rockets were used for the same purposes through much of Asia and Europe. In the next 600 years, people developed bigger and better solid rockets. Many of these were used by the military."),
        Page(imageName: "space2", headerText: "Our planet is beutiful", bodyText: "\n\n\nA Beautiful Planet is a breathtaking portrait of Earth from space, providing a unique perspective and increased understanding of our planet and galaxy as never seen before. Made in cooperation with the National Aeronautics and Space Administration (NASA), the film features stunning footage of our magnificent blue planet — and the effects humanity has had on it over time — captured by the astronauts aboard the International Space Station (ISS). "),
        Page(imageName: "space3", headerText: "Live in another galaxy", bodyText: "\n\n\nThe universe may be a lonelier place than previously thought. Of the estimated 100 billion galaxies in the observable universe, only one in 10 can support complex life like that on Earth, a pair of astrophysicists argues. Everywhere else, stellar explosions known as gamma ray bursts would regularly wipe out any life forms more elaborate than microbes. The detonations also kept the universe lifeless for billions of years after the big bang, the researchers say."),
        Page(imageName: "space4", headerText: "There are around 2,271 satellites in orbit", bodyText: "\n\n\nThis definition makes our count much less because it includes only spacecraft and not debris that orbits the Earth. The Goddard Space Flight Center's lists 2,271 satellites currently in orbit. Russia has the most satellites currently in orbit, with 1,324 satellites, followed by the U.S. with 658."),
    ]
    
    private let previewsButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlerPreview), for: .touchUpInside)
        return button
    }()
    
    private let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupBottonControls()
      
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.isPagingEnabled = true
        
    }
    

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x  = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
        print(x, view.frame.width, x / view.frame.width)
    }
    
    
    @objc private func handlerPreview(){
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath  = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext(){
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath  = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    

    fileprivate func setupBottonControls(){
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previewsButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually

        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
          
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    
    
    
    
}
