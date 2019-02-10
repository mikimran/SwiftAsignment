//
//  DetailViewController.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var moreDetailsButton: UIButton!
    @IBOutlet var ac: UIActivityIndicatorView!
    // Properties
    var detailItem: News?
    
    //View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ViewController Methods
    func configureView() {
        
        // Update the user interface for the detail item.
        if let dItem = detailItem {
            
            self.abstractLabel.text = dItem.abstract
            self.sectionLabel.text = dItem.section
            self.titleLabel.text = dItem.title
            self.byLineLabel.text = dItem.byline
            
            
            self.publishDateLabel.text = "🗓 "+(Utilities.splitstring(withstring: (dItem.published_date)!))
            
            self.moreDetailsButton.setTitle("See Full", for: .normal)
            
            self.previewImageView?.image = UIImage(named: DetailView.PlaceholderImageName)
            
            
            if let media = detailItem?.multimedia?[1] {
                if  let metadata = media.url{
                
                    self.ac.startAnimating()
                    self.previewImageView?.sd_setImage(with:URL(string: metadata), completed:{[weak self] (image, error, cache, url) in
                        
                        guard let strongSelf = self else {
                            return
                        }
                        
                        if let imgobj = image {
                            strongSelf.previewImageView?.image = imgobj
                            strongSelf.ac?.stopAnimating()
                            strongSelf.ac?.hidesWhenStopped = true
                            
                        } else {
                            print("didn't load image")
                            strongSelf.ac?.stopAnimating()
                            strongSelf.ac?.hidesWhenStopped = true
                        }})
                }
            }
        }
    }
    
    // MARK: - Button Actions
    @IBAction func didTapDetailsButton(_ sender: Any) {
        
        
        guard let dItem = detailItem else {
            return
        }
        if let urlstring = dItem.url{
            
            let url = URL(string: urlstring)
            
            if UIApplication.shared.canOpenURL(url!) {
                
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                
            }
            else {
                
                self.alert(message: "PROBLEM".localized(withComment: "Problem")+(dItem.url)!, title:"APP_NANE".localized(withComment: "APP_NANE"))
            
            }
        }
        else {
            
            self.alert(message: "NO_DATA".localized(withComment: "NO_DATA"), title:"Error")
            
            
        }
        
    }
    
}

