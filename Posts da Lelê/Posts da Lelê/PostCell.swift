//
//  PostCell.swift
//  Posts da Lelê
//
//  Created by Letícia Santos on 26/02/21.
//

import UIKit

class PostCell: UITableViewCell {

    var postImageView = UIImageView()
    var postTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(postImageView)
        addSubview(postTitleLabel)
        
        // MARK: Funcs of Image and Title post
        configurePostView()
        configurePostLabel()
        setTitleLabelConstraints()
        setImageConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Image and Label constraints  configuration
    
    func set(post: Post) {
        self.postImageView.image = post.postImage
        self.postTitleLabel.text = post.postName
    }
    
    func configurePostView(){
        postImageView.layer.cornerRadius = 10
        postImageView.clipsToBounds = true
    }
    
    func configurePostLabel(){
        postTitleLabel.numberOfLines = 0
        postTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postImageView.widthAnchor.constraint(equalTo: postImageView.heightAnchor, multiplier: 9/9).isActive = true
    }
    
    func setTitleLabelConstraints(){
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        postTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        postTitleLabel.leadingAnchor.constraint(equalTo: postImageView.trailingAnchor, constant: 20).isActive = true
        postTitleLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        postTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}


