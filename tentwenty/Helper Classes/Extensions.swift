//
//  Extensions.swift
//  tentwenty
//
//  Created by Omeesh Sharma on 05/07/20.
//  Copyright © 2020 Omeesh Sharma. All rights reserved.
//

import UIKit

extension String{
    
    func getImageURL()->URL?{
        return URL(string: (imagePrefix + self))
    }
    
    func getVideoURL()->URL?{
        return URL(string: (videoPrefix + self))
    }
}


extension UIView{
    
    func startProgresshud(){
        DispatchQueue.main.async {
            if self.viewWithTag(40) == nil{
                self.isUserInteractionEnabled = false
                let lockView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width / 4, height: self.frame.size.width / 4))
                lockView.layer.cornerRadius = 10
                lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
                lockView.tag = 40
                lockView.alpha = 0.0
                
                let activity = UIActivityIndicatorView()
                activity.color = .white
                activity.center = lockView.center
                activity.startAnimating()
                lockView.addSubview(activity)
                
                self.addSubview(lockView)
                
                UIView.animate(withDuration: 0.2) {
                    lockView.alpha = 1.0
                }
                lockView.center = self.center
            }
        }
    }
    
    func stopProgressHud() {
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = true
            if let lockView = self.viewWithTag(40) {
                UIView.animate(withDuration: 0.2, animations: {
                    lockView.alpha = 0.0
                }) { finished in
                    lockView.removeFromSuperview()
                }
            }
        }
    }
    
    
}
