//
//  AddNewFieldNoteViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 2/1/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class AddNewFieldNoteViewController: UIViewController {

    // MARK: - View Elements
    let noteTextView = FieldNoteTextView()
    
    // MARK: - For Saving
    var selectedWell: Well?
    var dataEntryController: DataEntryController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppLaunchViewController.blueHighlight
        setUpNavigationBar()
        configureTextView()
        
        noteTextView.becomeFirstResponder()        

    }
    
    override func viewDidAppear(_ animated: Bool) {

        noteTextView.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    // MARK: - Set Up View

    func setUpNavigationBar(){
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.leftBarButtonItem = cancel
        self.navigationItem.rightBarButtonItem = save
    }
    
    func configureTextView(){
        self.view.addSubview(noteTextView)
        noteTextView.showsHorizontalScrollIndicator = false
        noteTextView.alwaysBounceHorizontal = false
        noteTextView.autocorrectionType = .default
        noteTextView.autocapitalizationType = .sentences
        noteTextView.textAlignment = .natural
        noteTextView.keyboardType = .default
        noteTextView.font = UIFont.systemFont(ofSize: 18)
        
        
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: noteTextView, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 16)
        let leading = NSLayoutConstraint(item: noteTextView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 16)
        let trailing = NSLayoutConstraint(item: noteTextView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -16)
        let height = NSLayoutConstraint(item: noteTextView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.0, constant: 280)
        self.view.addConstraints([top, leading, trailing, height])
    }
    
    // MARK: - Navigation bar actions
    func cancelButtonTapped(){
        noteTextView.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveButtonTapped(){
        if noteTextView.text.characters.count == 0 {
            return
        } else {
        noteTextView.resignFirstResponder()
        }
        
        self.dataEntryController?.addFieldNoteToWell(dateWritten: NSDate(), note: noteTextView.text)
        dismiss(animated: true, completion: nil)
    }

}

