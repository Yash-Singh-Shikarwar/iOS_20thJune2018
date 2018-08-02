//
//  DiaryDataViewController.swift
//  DiaryApplication
//
//  Created by Yash Singh on 7/13/18.
//  Copyright © 2018 Yash Singh. All rights reserved.
//

import UIKit
protocol diaryDataProtocol: class
{
    func addData(diaryObject: DiaryModel)
}

var img_count: Int = 0      //to save image count and save them all

class DiaryDataViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var diaryImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var diaryInfo: DiaryModel?
    var diaryDelegateVar: diaryDataProtocol?
    var isNew: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //unarchiver in viewDidLoad
        var docDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        print(docDirectoryPath ?? "No path")
        
        if isNew{
            diaryInfo = DiaryModel(noteTitle: "", noteThought: "", noteImage: "", noteAge: 0)
        }

        if var object = NSKeyedUnarchiver.unarchiveObject(withFile: (docDirectoryPath?.appendingPathComponent("DiaryArchiver").path)!) as? DiaryModel
        {
            print(object.title)
            print(object.age)
        }

        // Do any additional setup after loading the view.
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        diaryInfo?.title = textField.text!
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        titleTextField.resignFirstResponder()
        return true
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        diaryInfo?.thought = textView.text
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            diaryImageView.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        //when we press cancel we dismiss the gallery
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loadGalleryButtonAction(_ sender: UIButton) {
        //load gallery and get image in the image view
        imagePicker.delegate = self
        if imagePicker.sourceType == .camera
        {
            imagePicker.sourceType = .camera
        } else{
            imagePicker.sourceType = .photoLibrary
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func saveImageButtonAction(_ sender: UIButton) {
        //save image to the document directory? or somewhere else? it will be defined in the encoding file so maybe it is document directory.. Then we pop back to the 1st screen
        let docDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        print(docDirectoryPath ?? "No path")
        
        let archiver = docDirectoryPath?.appendingPathComponent("DiaryArchiver")
        NSKeyedArchiver.archiveRootObject(diaryInfo, toFile: (archiver?.path)!)
        print(docDirectoryPath ?? "No path for archiver")
        
        if let newObj = diaryInfo
        {
            diaryDelegateVar?.addData(diaryObject: newObj)
            
        }
        
        createImageFolder()
        navigationController?.popViewController(animated: true)
    }
    
    func createImageFolder()   //document directory of image controller
    {
        //to access the document directory's 1st image in the array (using .first at the end)
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        if let path = documentDirectoryPath{
            print(path)
            
            //now to add images to the above path
            let imageDirectory = path.appending("/Images")  //adds a directory Images to the current path
            let fileManager = FileManager.default
            
            if !fileManager.fileExists(atPath: imageDirectory)
            {     //createDirectory is throwing exception so we need to put it in try catch. But we can't use try straight away. So we use do-(try) catch
                do{
                    try fileManager.createDirectory(atPath: imageDirectory, withIntermediateDirectories: false, attributes: nil)
                    //if directory does not exist, try to create it.. No intermediate directories for now
                }catch{
                    
                }
                
                
            }
            else{
                //how to save all the images? using an array?
                let imagePath = imageDirectory.appending("/Icon_\(img_count).png")   //we have unique name so it will replace the image
                diaryInfo?.imageName = "Icon_\(img_count).png"
                img_count = img_count + 1
                let dat = UIImagePNGRepresentation(diaryImageView.image!)
                fileManager.createFile(atPath: imagePath, contents: dat, attributes: nil)
            }
            
        }
        
    }
    
    //function to load image. Image needs to be loaded when we load the title and description. So.. when we are decoding the data? Seems like it.
    func getImage(){
        let documentDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let imagePAth = documentDirectoryPath?.appending("/Images/Icon.png")
        if let imgPath = imagePAth {
            print(imgPath)
            diaryImageView.image = UIImage(named: imgPath)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

/*archiver    URL?    "file:///Users/yashsingh/Library/Developer/CoreSimulator/Devices/838132E1-26D2-4DAC-922D-391251E8C622/data/Containers/Data/Application/2ABFE093-08D9-4BD7-86A7-07AF3477E2DD/Documents/DiaryArchiver"    some*/
