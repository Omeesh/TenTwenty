//
//  CatalogsViewController.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 29/06/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class CatalogsViewController: UIViewController {
    
    //MARK:- OUTLETS    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK:- VARIABLES
    var viewModel = CatalogViewModel()
    
    //MARK:- ACTIVITY CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.searchBar.delegate = self
        
        self.viewModel.getList(isNext: nil) {
            self.collectionView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    
}

extension CatalogsViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.searchMovie(title: searchText) {
            self.collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }

}

extension CatalogsViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.catalogArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCollectionViewCell", for: indexPath) as! CatalogCollectionViewCell
        cell.loadData(model: self.viewModel.catalogArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height / 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.endEditing(true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")as! DetailViewController
            vc.movieID = self.viewModel.catalogArray[indexPath.row].internalIdentifier
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == (self.viewModel.catalogArray.count - 1) && self.viewModel.apiHit == false && self.viewModel.pages.last != self.viewModel.lastPage && self.searchBar.text?.isEmpty == true{
            self.viewModel.getList(isNext: true) {
                collectionView.reloadData()
            }
        }else if indexPath.item == 0 && self.viewModel.apiHit == false && self.viewModel.pages.first != self.viewModel.firstPage && self.searchBar.text?.isEmpty == true{
            let currentMovieIndex = self.viewModel.catalogArray[indexPath.item].internalIdentifier
            self.viewModel.getList(isNext: false) {
                self.collectionView.reloadData()
                if let index = self.viewModel.catalogArray.firstIndex(where: {$0.internalIdentifier == currentMovieIndex}){
                    self.collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .top, animated: false)
                }
            }
        }
    }
    
}
