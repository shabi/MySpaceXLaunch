//
//  ImageViewExtension.swift
//  MySpaceXLaunch
//
//  Created by Shabi Naqvi on 11/08/22.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromUrl(imageURL :String) {
       URLSession.shared.dataTask( with: URL(string:imageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
             }
          }
       }).resume()
    }
}
