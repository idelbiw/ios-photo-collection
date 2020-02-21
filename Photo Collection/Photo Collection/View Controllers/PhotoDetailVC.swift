//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Waseem Idelbi on 12/12/19.
//  Copyright © 2019 Waseem Idelbi. All rights reserved.
//

import UIKit

protocol randomDelegate {
    func reloadTheStuff()
}

class PhotoDetailVC: UIViewController, UITextFieldDelegate {
    
    //MARK:-ViewDidLoad method-
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        picker.delegate = self
        photoTitle.delegate = self
        setupToHideKeyboardOnTapOnView()
        setTheme()
    }
    
    //MARK:-Outlet and Actions-
    @IBOutlet var image: UIImageView!
    @IBOutlet var photoTitle: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let selectedImage = image.image,
            let title = photoTitle.text,
            !title.isEmpty else {return}
        let imageData = selectedImage.pngData()
        photoController?.Create(image: imageData!, title: title)
        delegate?.reloadTheStuff()
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:-Important variables-
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var delegate: randomDelegate?
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
            view.backgroundColor = .systemGreen
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
