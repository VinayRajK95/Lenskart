//
//  MovieDetailsViewController.swift
//  Lenskart
//
//  Created by Vinay Raj on 29/05/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    @IBOutlet weak var overView: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var votes: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    private func setupUI() {
        self.movieTitle.text = "Title: " + self.movie.title
        self.overView.text = "Overview: " + self.movie.overview
        self.releaseDate.text = "Release Date: " + self.movie.releaseDate
        self.votes.text = "Votes" + String(self.movie.voteAverage)
        
        _ = URLSession.shared.loadImage(from: movie.imageURL, completion: { [weak self] image in
            guard let image = image else {
                debugPrint("failed to fetch image")
                return
            }
            DispatchQueue.main.async {
                self?.posterImageView.image = image
                self?.posterImageView.sizeToFit()
            }
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
