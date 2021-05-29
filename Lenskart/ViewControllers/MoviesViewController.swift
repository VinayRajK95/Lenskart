//
//  MoviesViewController.swift
//  Lenskart
//
//  Created by Vinay Raj on 29/05/21.
//

import UIKit

private let movieCell = "movieCell"
private let movieDetailsViewControllerID = "MovieDetailsViewController"

class MoviesViewController: UIViewController {
    
    let tableView = UITableView()
    
    let movies: [Movie]? = {
        return JSONParser.modelFromFile(fileName: "movies")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.addSubview(tableView)
        setupTableViewConstraints()
        registerTableViewCells()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "MOVIES"
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

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableViewConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
    
    func registerTableViewCells(){
        tableView.register(MovieTitleTableViewCell.self, forCellReuseIdentifier: movieCell)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: movieCell) as? ConfigureCellProtocol,
           let movie = self.movies?[indexPath.row] {
            cell.configureCell(movie: movie)
            return cell as! UITableViewCell
        }
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let movieDetailController = storyBoard.instantiateViewController(identifier: movieDetailsViewControllerID) as! MovieDetailsViewController
        movieDetailController.movie = self.movies![indexPath.row]
        self.navigationController?.pushViewController(movieDetailController, animated: true)
    }
    
}

protocol ConfigureCellProtocol {
    func configureCell(movie: Movie)
}
