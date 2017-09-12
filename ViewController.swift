//
//  ViewController.swift
//  PlayCam
//
//  Created by Stanford University GTGTC iOS Team on 3/16/17.
//  Copyright © 2017 anngbaum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    @IBOutlet var myImageView: UIImageView!

    @IBOutlet var coolButtonForClicking: UIButton!
    
    @IBOutlet var mySlider: UISlider!
    
    @IBOutlet var myStepper: UIStepper!
    
    @IBOutlet var myOne: UIButton!
    
    
    let imagePicker = UIImagePickerController()

    
    @IBAction func ClickAction(_ sender: UIButton) {
        coolButtonForClicking.setTitle("Great Job!", for:UIControlState.normal)
        //myImageView.alpha = myImageView.alpha/2.0
        myImageView.alpha = 0.5
    }
    
    @IBAction func ClickActionOne(_ sender: UIButton) {
        //coolButtonForClicking.setTitle("Great Job!", for:UIControlState.normal)
        //myImageView.alpha = myImageView.alpha/2.0
        myImageView.alpha = 0.1
    }

    
    @IBAction func adjustSlider(_ sender: UISlider) {
        myImageView.alpha = CGFloat(mySlider.value)
        updateToggles()
    }
    
    @IBAction func adjustStepper(_ sender:UIStepper) {
        myImageView.alpha = CGFloat(myStepper.value)
        updateToggles()
    }
    
    func updateToggles() {
        if (myStepper != nil) {
            myStepper.value = Double(myImageView.alpha)
        }
        if (mySlider != nil) {
            mySlider.value = Float(myImageView.alpha)
        }
    }

    @IBAction func pushCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            myImageView.contentMode = .scaleAspectFit
            myImageView.image = pickedImage
        }
        dismiss(animated:true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (myStepper != nil) {
            myStepper.value = 1.0
            myStepper.maximumValue = 1.0
            myStepper.minimumValue = 0.0
            myStepper.stepValue = 0.05
        }
        
        if (mySlider != nil) {
            mySlider.value = 1.0
        }
        imagePicker.delegate = self
    }
}
