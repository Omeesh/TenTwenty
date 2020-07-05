//
//  CatalogCollectionViewCell.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 04/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    
    //MARK:- Display Data
    
    func loadData(model: MovieListModel){
        let moviePoster = (model.posterPath ?? "").getImageURL()
        self.movieImage.sd_setImage(with: moviePoster, placeholderImage: nil, options: [], completed: nil)
        self.movieName.text = model.originalTitle ?? ""
    }
    
}
