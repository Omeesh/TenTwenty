//
//  DetailTableViewCell.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 05/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    //MARK:- OUTLETS
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var trailerBtn: UIButton!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailSubtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        guard self.imageHeight != nil else {return}
        if UIDevice.current.orientation.isLandscape{
            self.imageHeight.constant = UIScreen.main.bounds.height * 0.6
        } else{
            self.imageHeight.constant = UIScreen.main.bounds.height * 0.3
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Display Data
    
    func loadImage(model: DetailModel?){
        let moviePoster = (model?.posterPath ?? "").getImageURL()
        self.movieImage.sd_setImage(with: moviePoster, placeholderImage: nil, options: [], completed: nil)
        
        self.movieTitle.text = model?.originalTitle ?? ""
    }
    
    
    func loadDetails(model: DetailModel?, type: DetailType){
        self.detailTitle.text = type.rawValue
        
        switch type{
        case .Genres:
            self.detailSubtitle.text = model?.genres?.map({$0.name ?? ""}).joined(separator: ", ")
        case .Date:
            self.detailSubtitle.text = model?.releaseDate
        default:
            self.detailSubtitle.text = model?.overview
        }
    }
    
}
