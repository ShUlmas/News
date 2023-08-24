//
//  NewsTableViewCell.swift
//  News
//
//  Created by O'lmasbek on 23/08/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "NewsTableViewCell"
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lbl.textColor = .label
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private let descLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 4
        return lbl
    }()
    
    private let imgView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleToFill
        imgV.layer.cornerRadius = 10
        imgV.translatesAutoresizingMaskIntoConstraints = false
        return imgV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(imgView)
        
        selectionStyle = .none
        
        addConstraint()
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imgView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            imgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            imgView.heightAnchor.constraint(equalToConstant: 200),
            
            
            titleLabel.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descLabel.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            descLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            descLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
        ])
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        descLabel.text = viewModel.description
        
        if let imageData = viewModel.imageData {
            imgView.image = UIImage(data: imageData)
        } else {
            guard let url = viewModel.imageUrl else { return }
            ImageLoader.shared.loadImage(from: url) { image in
                DispatchQueue.main.async {
                    self.imgView.image = image
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
