//
//  SwipeControllerExtenxion.swift
//  Autolayout
//
//  Created by Victor Santos on 1/19/18.
//  Copyright © 2018 itsoluclick. All rights reserved.
//

import UIKit

extension SwipeController {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            }
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
    
    
}
