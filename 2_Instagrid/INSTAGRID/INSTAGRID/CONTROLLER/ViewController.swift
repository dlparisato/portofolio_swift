//
//  ViewController.swift
//  INSTAGRID
//
//  Created by DL PARISATO on 28/03/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    
//MARK:- PROPERTIES
    
    
    private var selectButton: UIButton?
    
    private var swipeGesture: UISwipeGestureRecognizer?
    
    let imagePickerController = UIImagePickerController()
    
    
//MARK:- OUTLETS and ACTIONS: connect the controller and the view
    
    
    //swipe
    @IBOutlet weak var swipeLabel: UILabel!
    
    //main grid
    @IBOutlet weak var mainGridView: UIView!
    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var bottomRightView: UIView!
    
    //buttons
    @IBOutlet var groupButton: [UIButton]!
    
    
    // User chooses the button
    @IBAction func chooseButton(_ sender: UIButton) {
        groupButton.forEach { $0.isSelected = false }
         sender.isSelected = true
         
         switch sender.tag {
         case 1:
             topRightView.isHidden = true
             bottomRightView.isHidden = false
         case 2:
             topRightView.isHidden = false
             bottomRightView.isHidden = true
         case 3:
             topRightView.isHidden = false
             bottomRightView.isHidden = false
         default:
             break
         }
    }
    
    
    // This function put the images
    @IBAction func pickerUpImage(_ sender: UIButton) {
        selectButton = sender
        
        let actionSheet = UIAlertController(title: "Upload Photo", message: "Choose a source", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action: UIAlertAction) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    
    //MARK:- METHODS: UISwipeGestureRecognizer and UIActivityViewController
    
    
    //This function allows to configure the direction in portrait and landscape
    @objc private func settingDirection() {
        
        //portrait mode
        if UIDevice.current.orientation == .portrait {
            swipeGesture?.direction = .up
            swipeLabel.text = "Swipe up to share"
            
        //landscape mode
        } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
            swipeGesture?.direction = .left
            swipeLabel.text = "Swipe left to share"
        }
    }
    
    
    //This function allows to swipe the direction Up or Left
    @objc private func swipeDirection(sender: UISwipeGestureRecognizer) {
        
        if sender.direction == .up {
            swipeUpToShare()
        } else {
            swipeLeftToShare()
        }
    }
    
    
    // Animation: to swipe up to share
    private func swipeUpToShare() {
        UIView.animate(withDuration: 1, animations: {
            self.mainGridView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
        }) { (_) in
            self.shareUIActivityViewController()
        }
    }
    
    
    // Animation: to swipe left to share
    private func swipeLeftToShare() {
        UIView.animate(withDuration: 1, animations: {
            self.mainGridView.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
        }) { (_) in
            self.shareUIActivityViewController()
        }
    }
    
    
    //This function allows to share the image. We use with a class UIActivityViewController
    private func shareUIActivityViewController() {
        
        let items = [mainGridView.transformImage] // => see the file UIView.swift
        let ac = UIActivityViewController(activityItems: items , applicationActivities: nil)
        present(ac, animated: true)
        ac.completionWithItemsHandler = { _, _ , _, _ in
            UIView.animate(withDuration: 1) {
                self.mainGridView.transform = .identity  // => to return to the original position = identity
            }
        }
    }
    
    
//MARK:- METHOD: viewDidLoad called after the ViewController is loaded into memory.
    
        
  override func viewDidLoad() {
      super.viewDidLoad()
    
      // exemple parametre: swipe = UISwipeGestureRecognizer(target: self, action: #selector(executeSwipe))
      swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDirection(sender:)))
      guard let swipeGesture = swipeGesture else { return }
      settingDirection()
      mainGridView.addGestureRecognizer(swipeGesture)
      NotificationCenter.default.addObserver(self, selector: #selector(settingDirection), name: UIDevice.orientationDidChangeNotification, object: nil)
      imagePickerController.delegate = self
  }

}



//MARK:- METHOD: UIImagePickerController

//Install two protocols: UIImagePickerControllerDelegate and UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        // the variable image symbolizes the image You have selected
        let image = info[.originalImage] as? UIImage
        selectButton?.setImage(image, for: .normal)
        selectButton?.subviews.first?.contentMode = .scaleAspectFill  // => we access the subview, the first is the image and contenMode of image. And scaleAspectfille is scale.
        
        picker.dismiss(animated: true, completion: nil)  // => dismiss: when you select your image. And you close the picker
    }
    
}



