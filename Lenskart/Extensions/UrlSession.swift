//
//  UrlSession.swift
//  Lenskart
//
//  Created by Vinay Raj on 29/05/21.
//

import Foundation
import UIKit

extension URLSession {
    
    public static let imageCache = NSCache<NSURL, UIImage>()
    
    public func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) -> URLSessionDataTask? {

        if let image = URLSession.imageCache.object(forKey: url as NSURL) {
            completion(image)
        } else {
            let task = self.dataTask(with: url) { (imageData, _, _) in
                guard let imageData = imageData,
                    let image = UIImage(data: imageData)
                    else {
                        completion(nil)
                        return
                }
                URLSession.imageCache.setObject(image, forKey: url as NSURL)
                completion(image)

            }
            task.resume()
            return task
        }
        return nil
    }
    
}
