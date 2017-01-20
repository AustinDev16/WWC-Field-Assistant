//
//  AddNewFieldPhotoViewController.swift
//  WWCFieldAssistant
//
//  Created by Austin Blaser on 1/17/17.
//  Copyright © 2017 Austin Blaser. All rights reserved.
//

import UIKit

class AddNewFieldPhotoViewController: UIViewController {
    // MARK: - Properties
    let imagePicker = UIImagePickerController()
    let imageView = UIImageView()
    let captionLabel = UILabel()
    let caption = UITextView()
    var tableView: UITableView {
        if _tableView == nil {
            _tableView = UITableView(frame: self.view.frame, style: .grouped)
        }
        return _tableView!
    }
    
    private var _tableView: UITableView? = nil
    
    // For saving
    var selectedWell: Well?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        caption.delegate = self
        captionLabel.text = "Caption:"
        
        setUpNavigationBar()
        setUpTableView()
        showAlertToSelectMediaType()
        
    }
    
    func setUpNavigationBar(){
        self.title = "New Field Photo"
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.leftBarButtonItem = cancel
        self.navigationItem.rightBarButtonItem = save
        
        if caption.text.characters.count == 0 {
            save.isEnabled = false
        }
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        self.view.addConstraints([top, bottom, leading, trailing])
    }
    
    // Photo selection
    func showAlertToSelectMediaType(){
        let mediaAlert = UIAlertController(title: nil, message: "Add photo from", preferredStyle: .alert)
        let camera = UIAlertAction(title: "Camera", style: .default) { (_) in
            self.launchImagePickerWith(type: .camera)
        }
        let mediaLibrary = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            self.launchImagePickerWith(type: .photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            self.dismiss(animated: true, completion: nil)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            mediaAlert.addAction(camera)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            mediaAlert.addAction(mediaLibrary)
        }
        
        mediaAlert.addAction(cancel)
        
        self.present(mediaAlert, animated: true, completion: nil)
        
    }
    
    func launchImagePickerWith(type: UIImagePickerControllerSourceType){
        imagePicker.sourceType = type
        imagePicker.allowsEditing = false
        imagePicker.modalPresentationStyle = .popover
        present(imagePicker, animated: true, completion: nil)
        let popoverController = imagePicker.popoverPresentationController
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRect(x: Double(self.view.frame.width/2.0), y: 35, width: 1, height: 1)
       
    }
    
    func cancelButtonTapped(){
        self.caption.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }

    func saveButtonTapped(){
        self.caption.resignFirstResponder()
        if selectedWell != nil && imageView.image != nil {
           //  let newPhoto = FieldPhoto(dateTaken: NSDate(), comment: caption.text, name: "", dataEntry: <#T##DataEntry#>, image: <#T##UIImage#>)
        }
        dismiss(animated: true, completion: nil)
    }
}

extension AddNewFieldPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        imageView.image = selectedImage
        dismiss(animated: true) {
            self.caption.becomeFirstResponder()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true) { 
            self.cancelButtonTapped()
        }
    }

}

extension AddNewFieldPhotoViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        self.setUpNavigationBar()
    }
}

extension AddNewFieldPhotoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return buildPhotoCell()
    }
    
    func buildPhotoCell() -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentView.addSubview(imageView)
        cell.contentView.addSubview(captionLabel)
        cell.contentView.addSubview(caption)

        
        caption.autocorrectionType = .default
        caption.autocapitalizationType = .sentences
        
        // Layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let leadingIV = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: cell.contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        let topIV = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: cell.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottomIV = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: cell.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let widthIV = NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: cell.contentView, attribute: .width, multiplier: 0.5, constant: 0)
        cell.contentView.addConstraints([leadingIV, topIV, bottomIV, widthIV])
        
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCL = NSLayoutConstraint(item: captionLabel, attribute: .top, relatedBy: .equal, toItem: cell.contentView, attribute: .top, multiplier: 1.0, constant: 4)
        let heightCL = NSLayoutConstraint(item: captionLabel, attribute: .height, relatedBy: .equal, toItem: cell.contentView, attribute: .height, multiplier: 0, constant: 30)
        let widthCL = NSLayoutConstraint(item: captionLabel, attribute: .width, relatedBy: .equal, toItem: cell.contentView, attribute: .width, multiplier: 0.5, constant: -16)
        let trailingCL = NSLayoutConstraint(item: captionLabel, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1.0, constant: -8)
        cell.contentView.addConstraints([topCL, heightCL, widthCL, trailingCL])
        
        caption.translatesAutoresizingMaskIntoConstraints = false
        let width = NSLayoutConstraint(item: caption, attribute: .width, relatedBy: .equal, toItem: cell.contentView, attribute: .width, multiplier: 0.5, constant: -16)
        let top = NSLayoutConstraint(item: caption, attribute: .top, relatedBy: .equal, toItem: captionLabel, attribute: .bottom, multiplier: 1.0, constant: 4)
        let bottom = NSLayoutConstraint(item: caption, attribute: .bottom, relatedBy: .equal, toItem: cell.contentView, attribute: .bottom, multiplier: 1.0, constant: -8)
        let trailing = NSLayoutConstraint(item: caption, attribute: .trailing, relatedBy: .equal, toItem: cell.contentView, attribute: .trailing, multiplier: 1.0, constant: -8)
        cell.contentView.addConstraints([width, top, bottom, trailing])
        
        cell.contentView.backgroundColor = UIColor.white//UIColor.brown.withAlphaComponent(0.3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
