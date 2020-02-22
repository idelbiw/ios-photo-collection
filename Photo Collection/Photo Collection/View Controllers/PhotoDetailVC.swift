//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 12/12/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

class PhotoDetailVC: UIViewController, UITextFieldDelegate {
    
    //MARK:-ViewWillAppear method-
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
        picker.delegate = self
        photoTitle.delegate = self
        setupToHideKeyboardOnTapOnView()
        setTheme()
        textFieldContainer.layer.borderWidth = 1
        textFieldContainer.layer.borderColor = UIColor.systemYellow.cgColor
        let placeHolderAttrStr = NSAttributedString(string: "Add a title", attributes: [.foregroundColor  : #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)])
        photoTitle.attributedPlaceholder = placeHolderAttrStr
    
    }
    //MARK:-IBOutlet and IBActions-
    @IBOutlet var textFieldContainer: UIView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var photoTitle: UITextField!
    
    @IBAction func addPhoto(_ sender: UIBarButtonItem) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let selectedImage = image.image,
            let title = photoTitle.text,
            !title.isEmpty else {return}
        let imageData = selectedImage.pngData()
        photoController?.Create(image: imageData!, title: title)
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:-Important variables-
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var picker = UIImagePickerController()
    
    //MARK:-Important methods-
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        photoTitle.resignFirstResponder()
        return true
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else {return}
        photoTitle.text = photo.title
        image.image = UIImage(data: photo.imageData)
    }
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else {return}
        if theme == "Dark" {
            view.backgroundColor = .darkGray
        } else if theme == "Green" {
            view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        }
    }
    
}

extension PhotoDetailVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[.originalImage] as? UIImage
        image.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
