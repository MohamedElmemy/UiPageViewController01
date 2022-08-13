//
//  ViewController.swift
//  UiPageViewController
//
//  Created by Ahmed Elmemy on 12/08/2022.
//

import UIKit
import MOLH

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var LanguageButton: UIButton!
    
    var currentPage = 0
    var arrOfContainers = [UIViewController]()
    var pageImage : UIImage? , pageDescription : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        LanguageButton.setTitle("LanguageButton".localized , for: .normal)
        if let image = pageImage{
            imageView.image = image
        }
        if let title = pageDescription{
            Description.text = title
        }
        
      
    }

    @IBAction func Changelanguage(_ sender: Any) {
        
        let alert = UIAlertController(title: "Alert".localized, message: "Message".localized, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Launch".localized, style: UIAlertAction.Style.destructive, handler: { action in
            
            
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "en" ? "ar" : "en")
            MOLH.reset()
            
            
          
            
            
        }))
        
        
        
        self.present(alert, animated: true, completion: nil)
        
        
}

}

    
 
