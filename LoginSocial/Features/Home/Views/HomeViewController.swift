//
//  HomeViewController.swift
//  LoginSocial
//
//  Created by Nguyen Tran Cong on 12/11/19.
//  Copyright © 2019 Nguyen Tran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeViewModel(getData())
        collectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
        collectionView.backgroundColor = .gray
        print("=============================")
        print(Environment.apiKey)
        print(Environment.rootURL.absoluteString)
    }

}

// MARK:  confixgure data for cell collection view

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfObject() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            fatalError("can't dequeue reusable home cell!")
        }
        cell.configCell(viewModel?.getItem(indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = viewModel?.getItem(indexPath.row) else {
            return
        }
        
        switch item.title {
        case Constant.Strings.facebook:
            let facebookViewController = FacebookViewController()
            facebookViewController.title = Constant.Strings.facebook
            facebookViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(facebookViewController, animated: true)
            
        case Constant.Strings.google:
            let googleViewContrller = GoogleViewController()
            googleViewContrller.title = Constant.Strings.google
            googleViewContrller.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(googleViewContrller, animated: true)
            
        default:
            return
        }
    }
}

// MARK:  size for cell collection view

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: 100.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

// MARK:  get data for home view controller

private extension HomeViewController {
    func getData() -> [HomeModel] {
        var result: [HomeModel] = []
        let facebook = HomeModel(1, Constant.Strings.facebook, "Facebook")
        result.append(facebook)
        let google = HomeModel(2, Constant.Strings.google, "Google")
        result.append(google)
        
        return result
    }
}
