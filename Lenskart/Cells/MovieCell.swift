//
//  MovieCell.swift
//  Lenskart
//
//  Created by Vinay Raj on 29/05/21.
//

import Foundation
import UIKit

class MovieTitleTableViewCell: UITableViewCell, ConfigureCellProtocol {
    
    let titleLabel: UILabel = {
        let innerLabel = UILabel()
        innerLabel.translatesAutoresizingMaskIntoConstraints = false
        innerLabel.textColor = UIColor.black
        innerLabel.textAlignment = .left
        innerLabel.numberOfLines = 0
        return innerLabel
    }()
    
    let moviePosterImageView: UIImageView = {
        let innerImageview = UIImageView()
        innerImageview.translatesAutoresizingMaskIntoConstraints = false
        innerImageview.contentMode = .scaleAspectFit
        return innerImageview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.imageView?.image = nil
    }
    
    func setupUI() {
        self.addSubview(titleLabel)
        self.addSubview(moviePosterImageView)
        
        moviePosterImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        moviePosterImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        
        
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16).isActive = true
        titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 16).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.moviePosterImageView.bottomAnchor, constant: 8).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
    }

    func configureCell(movie: Movie){
        self.titleLabel.text = movie.title
        _ = URLSession.shared.loadImage(from: movie.imageURL, completion: { [weak self] image in
            guard let image = image else {
                debugPrint("failed to fetch image")
                return
            }
            DispatchQueue.main.async {
                self?.moviePosterImageView.image = image
                self?.moviePosterImageView.sizeToFit()
            }
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
