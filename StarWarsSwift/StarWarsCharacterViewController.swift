//
//  StarWarsCharacterViewController.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 12/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit

class StarWarsCharacterViewController: UIViewController, StarWarsUniverseTableViewControllerDelegate, UISplitViewControllerDelegate {
    
    var character : StarWarsCharacter?
    var player = CafPlayer()
    
    @IBOutlet weak var characterImageView: UIImageView!
    
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
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        
        syncViewAndModel()
        
        
    }
    
    // MARK: Actions
    @IBAction func displayWeb(sender: AnyObject) {
        
        if let character = self.character {
            var vc = WikiViewController(nibName: "WikiViewController", bundle: nil, character: character)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func playSound(sender: AnyObject) {
        
        
        if let soundData = character?.sound {
            player.playSoundData(soundData)
        }
    }
    
    // MARK: StarWarsUniverseTableViewControllerDelegate
    
    func starWarsViewController(_ swvc: StarWarsUniverseTableViewController,
        didSelectCharacter: StarWarsCharacter) {
            
            self.character = didSelectCharacter
            syncViewAndModel()
    }
    
    // MARK: UISplitViewControllerDelegate
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        
        if displayMode == UISplitViewControllerDisplayMode.PrimaryHidden {
            navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
        } else {
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    // MARK: Utils
    
    func syncViewAndModel() {
        
        self.characterImageView.image = self.character?.photo
        title = character?.alias
    }
    
}
