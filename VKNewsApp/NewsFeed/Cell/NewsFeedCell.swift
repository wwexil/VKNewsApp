//
//  NewsFeedCell.swift
//  VKNewsApp
//
//  Created by Алекс Мерсер on 29.03.2022.
//

import UIKit

protocol FeedCellViewModel {
    var iconUrlString: String { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var likes: String? { get }
    var comments: String? { get }
    var share: String? { get }
    var views: String? { get }
}

class NewsFeedCell: UITableViewCell {
    static let reusedId = "NewsFeedCell"
    
    @IBOutlet weak var iconImageView: WebImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageURL: viewModel.iconUrlString)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likesLabel.text = viewModel.likes
        commentsLabel.text = viewModel.comments
        shareLabel.text = viewModel.share
        viewsLabel.text = viewModel.views
    }
}
