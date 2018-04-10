//
//  ViewController.swift
//  New poll page
//
//  Created by Shreyash Sharma on 10/04/18.
//  Copyright © 2018 Shreyash Sharma. All rights reserved.
//

import UIKit

extension UITextField {
    func setPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width , height: self.frame.width-4))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setBottomBorder()
    {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}


extension String {
    func attributedString(aligment: NSTextAlignment) -> NSAttributedString {
        return NSAttributedString(text: self, aligment: aligment)
    }
}

extension NSAttributedString {
    convenience init(text: String, aligment: NSTextAlignment) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = aligment
        self.init(string: text, attributes: [NSAttributedStringKey.paragraphStyle: paragraphStyle])
    }
}

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell( withIdentifier: "GroupTableViewCell") as?
            GroupTableViewCell
        {
            cell.contentView.backgroundColor = .white
            cell.heightAnchor.constraint(equalToConstant: 100).isActive = true
            return cell
        }
        else {
            return GroupTableViewCell()
        }
    }
    
    
    lazy var myTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.borderWidth = 1.5
        tableView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tableView.layer.cornerRadius = 10.0
        tableView.separatorStyle = .none

        return tableView
        
    }()

    
    
    
    
    lazy var nameTextField : UITextField = {
        let nameText = UITextField()
        
        nameText.translatesAutoresizingMaskIntoConstraints = false
        nameText.attributedPlaceholder = NSAttributedString(text: "Enter issue", aligment: .left )
        nameText.setPadding()
        nameText.setBottomBorder()
        return nameText
    }()
    
    
    lazy var choiceTextField : UITextField = {
        let choiceText = UITextField()
        choiceText.translatesAutoresizingMaskIntoConstraints = false
        
        choiceText.attributedPlaceholder = NSAttributedString(text:"Enter Choice", aligment: .left)
        choiceText.setPadding()
        choiceText.setBottomBorder()
        return choiceText
        
    }()
    
    lazy var choiceTextFieldSecond : UITextField = {
        let choiceText = UITextField()
        choiceText.translatesAutoresizingMaskIntoConstraints = false
        
        choiceText.attributedPlaceholder = NSAttributedString(text:"Enter Choice", aligment: .left)
        
        choiceText.setPadding()
        choiceText.setBottomBorder()
        return choiceText
        
    }()
    
    
    lazy var addChoiceButton : UIButton = {
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.contentMode = .scaleAspectFit
        addButton.setImage(#imageLiteral(resourceName: "plusButton"), for: .normal)
        
        
        return addButton
    }()
    
    
    lazy var addChoiceTextLabel : UILabel = {
       let addLabel = UILabel()
        addLabel.text = "Add choice"
        addLabel.textColor = UIColor.darkGray
        addLabel.font = addLabel.font.withSize(12)
        addLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        return addLabel
    }()
    
    
    lazy var addParticipantlabel : UILabel = {
        let addPLabel = UILabel()
        addPLabel.textColor = UIColor.darkGray
        addPLabel.text = "Add Participant"
        addPLabel.font = addPLabel.font.withSize(12)
        addPLabel.translatesAutoresizingMaskIntoConstraints = false
        return addPLabel
    }()
    
    lazy var pollEndLabel : UILabel = {
       let endLabel = UILabel()
        endLabel.textColor = UIColor.darkGray
        endLabel.text = "Poll Ends:"
        endLabel.font = endLabel.font.withSize(12)
        endLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return endLabel
    }()
    
    lazy var pollEndDateAndTimeLabel : UILabel = {
       let dateAndTimeLabel = UILabel()
        
        dateAndTimeLabel.textColor = UIColor.darkGray
        dateAndTimeLabel.text = "20/3/18,20:19"
        dateAndTimeLabel.font = dateAndTimeLabel.font.withSize(12)
        dateAndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        return dateAndTimeLabel
    }()
    
    

    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.myTableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "GroupTableViewCell")
        setupView()
        
    }
    
    func setupView()
    {    //MARK: Name Text Field.
        
        view.addSubview(nameTextField)
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant:75).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //MARK : Choice text fields
        //1
        view.addSubview(choiceTextField)
        
        choiceTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        choiceTextField.widthAnchor.constraint(equalToConstant:120).isActive = true
        choiceTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 14).isActive = true
        choiceTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor , constant: 20).isActive = true
        //2
        
        view.addSubview(choiceTextFieldSecond)
        
        choiceTextFieldSecond.heightAnchor.constraint(equalToConstant: 40).isActive = true
        choiceTextFieldSecond.widthAnchor.constraint(equalToConstant:120).isActive = true
        choiceTextFieldSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 14).isActive = true
        choiceTextFieldSecond.topAnchor.constraint(equalTo: choiceTextField.bottomAnchor , constant: 1).isActive = true
        
        
        //MARK:Add choice button
        view.addSubview(addChoiceButton)
        addChoiceButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addChoiceButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addChoiceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:14).isActive = true
        addChoiceButton.topAnchor.constraint(equalTo: choiceTextFieldSecond.bottomAnchor, constant:10).isActive = true
        
        
        //MARK: Add choice label
        
        view.addSubview(addChoiceTextLabel)
        addChoiceTextLabel.centerYAnchor.constraint(equalTo: addChoiceButton.centerYAnchor).isActive = true
        addChoiceTextLabel.leftAnchor.constraint(equalTo: addChoiceButton.rightAnchor, constant:3).isActive = true
        addChoiceTextLabel.heightAnchor.constraint(equalToConstant:10).isActive = true
        addChoiceTextLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addChoiceTextLabel.topAnchor.constraint(equalTo:choiceTextFieldSecond.bottomAnchor, constant:18).isActive = true
        
        //MARK: Add Participant label
         view.addSubview(addParticipantlabel)
         addParticipantlabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
         addParticipantlabel.topAnchor.constraint(equalTo: addChoiceTextLabel.bottomAnchor, constant: 60).isActive = true

        addParticipantlabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        addParticipantlabel.widthAnchor.constraint(equalToConstant: 150).isActive = true

        
        //MARK:Add Poll ends Labe;
        
        view.addSubview(pollEndLabel)
       pollEndLabel.centerYAnchor.constraint(equalTo: addChoiceTextLabel.centerYAnchor).isActive = true
       pollEndLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        
       pollEndLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        pollEndLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        view.addSubview(pollEndDateAndTimeLabel)
pollEndDateAndTimeLabel.centerYAnchor.constraint(equalTo: addChoiceTextLabel.centerYAnchor).isActive = true
pollEndDateAndTimeLabel.leadingAnchor.constraint(equalTo: pollEndLabel.trailingAnchor).isActive = true
        
        //MARK: Table view
        
        view.addSubview(myTableView)
        
   myTableView.topAnchor.constraint(equalTo: addParticipantlabel.bottomAnchor, constant: 10).isActive = true
   myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
   myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 12).isActive = true
   myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    
    
    }
    
    
    
    
    
    
    
    
    
    
}

