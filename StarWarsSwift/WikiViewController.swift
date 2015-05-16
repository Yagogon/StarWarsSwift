//
//  WikiViewController.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 14/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {
    
    
    var character : StarWarsCharacter?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webVIew: UIWebView!
    
    
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, character: StarWarsCharacter) {
        self.init(nibName:nibNameOrNil, bundle:nibBundleOrNil)
        self.character = character
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        webVIew.delegate = self
        syncViewAndModel()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "updateCharacter:", name: Constants().CHARACTER_CHANGE_NOTIFICATION, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
    }
    func syncViewAndModel() {
        
        activityIndicator.hidden = false
        activityIndicator.startAnimating()
        title = character?.alias
        
        if let wikiURL = character?.wikiURL {
            webVIew.loadRequest(NSURLRequest(URL: wikiURL))
        }
    }
    
    // MARK: UIWebViewDelegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.hidden = true
        activityIndicator.stopAnimating()
    }
    
    // MARK: Notifications
    
    func updateCharacter(notification : NSNotification) {
        
        if let userInfo = notification.userInfo as? Dictionary<String, StarWarsCharacter> {
            
            self.character = userInfo[Constants().CHARACTER_KEY]
            syncViewAndModel()
        }
        
    }
    
}
