//
//  GroupTableViewCell.swift
//  New poll page
//
//  Created by Shreyash Sharma on 10/04/18.
//  Copyright © 2018 Shreyash Sharma. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    var studentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return view
    }()
    
    var studentLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.textColor = .white
        view.text = "A"
        view.textAlignment = .center
        view.layer.cornerRadius = view.frame.width / 2
        view.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        return view
    }()
    
    
    var studentNameLabel : UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.textColor = .blue
        view.text = "Shreyash Sharma"
        view.textAlignment = .left
        view.font = UIFont(name: "HelveticaNeue", size: 18)
        return view
    }()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView()
    {
        addSubview(studentView)
        studentView.topAnchor.constraint(equalTo: topAnchor , constant: 10).isActive = true
        studentView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        studentView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        studentView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        studentView.layer.cornerRadius = 50 / 2
        
        studentView.addSubview(studentLabel)
        studentLabel.centerXAnchor.constraint(equalTo: studentView.centerXAnchor).isActive = true
        studentLabel.centerYAnchor.constraint(equalTo: studentView.centerYAnchor).isActive = true

        addSubview(studentNameLabel)
        studentNameLabel.leftAnchor.constraint(equalTo: studentView.rightAnchor , constant: 15).isActive = true
        studentNameLabel.topAnchor.constraint(equalTo: topAnchor, constant:14 ).isActive = true
        studentNameLabel.sizeToFit()
        
     
        
    }
    
    
    
    
}
