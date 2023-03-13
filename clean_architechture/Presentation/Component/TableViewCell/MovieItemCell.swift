//
//  MovieItemCell.swift
//  clean_architechture
//
//  Created by phan.duong.ngoc on 2023/03/10.
//

import UIKit
import Reusable
import Kingfisher

final class MovieItemCell: BaseTableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.kf.cancelDownloadTask()
        titleLabel.text = nil
        typeLabel.text = nil
        averageLabel.text = nil
    }
    
    func bind(movie: Movie) {
        titleLabel.text = movie.title
        typeLabel.text = movie.video ? "Video" : "Others"
        averageLabel.text = "\(movie.voteAverage)"
        if let url = URL(string: movie.posterUrl) {
            posterImageView.kf.setImage(with: url)
        }
    }
}
