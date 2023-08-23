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
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private let descLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lbl.textColor = .secondaryLabel
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 1
        return lbl
    }()
    
    private let imgView: UIImageView = {
        let imgV = UIImageView()
        imgV.contentMode = .scaleAspectFit
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
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            
            descLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            imgView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 80),
            imgView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        descLabel.text = viewModel.description
        
        if let imageData = viewModel.imageData {
            imgView.image = UIImage(data: imageData)
        } else {
            //fetch
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
