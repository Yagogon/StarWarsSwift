//
//  StarWarsUniverseTableViewController.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 12/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit

protocol StarWarsUniverseTableViewControllerDelegate {
    
    func starWarsViewController(_ swvc: StarWarsUniverseTableViewController,
        didSelectCharacter: StarWarsCharacter)
    
}

class StarWarsUniverseTableViewController: UITableViewController, StarWarsUniverseTableViewControllerDelegate {
    
    var model : StarWarsUniverse?
    var delegate : StarWarsUniverseTableViewControllerDelegate?
    
    
    convenience init(style: UITableViewStyle, model: StarWarsUniverse) {
        self.init(style:style)
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // Return the number of sections.
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        if section == Constants().IMPERIAL_INDEX {
            if let model = self.model {
                return model.imperialsCount
            }
            
        }
        
        if let model = self.model {
            return model.rebelsCount
        }
        
        return 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "starWarsCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        if indexPath.section == Constants().IMPERIAL_INDEX {
            if let character = model?.imperialAtIndex(indexPath.row), let cell = cell {
                configureCell(cell, starWarsCharacter: character)
            }
        } else {
            if let character = model?.rebelAtIndex(indexPath.row), let cell = cell {
                configureCell(cell, starWarsCharacter: character)
            }
        }
        
        
        // Configure the cell...
        
        return cell!
    }
    
    func configureCell(cell : UITableViewCell, starWarsCharacter : StarWarsCharacter) {
        
        cell.textLabel?.text = starWarsCharacter.alias
        cell.detailTextLabel?.text = starWarsCharacter.name
        cell.imageView?.image = starWarsCharacter.photo
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.section == Constants().IMPERIAL_INDEX {
            if let character = model?.imperialAtIndex(indexPath.row) {
                
                actionsForSelectedRow(character, indexPath: indexPath)
            }
            
        } else {
            if let character = model?.rebelAtIndex(indexPath.row) {
                
                actionsForSelectedRow(character, indexPath: indexPath)
                
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == Constants().IMPERIAL_INDEX {
            return "Imperials"
        }
        
        return "Rebels"
    }
    
    func starWarsViewController(_ swvc: StarWarsUniverseTableViewController,
        didSelectCharacter: StarWarsCharacter) {
            
            var vc = StarWarsCharacterViewController(nibName: "StarWarsCharacterViewController", bundle: nil, character: didSelectCharacter)
            
    }
    
    // MARK: Actions
    
    func actionsForSelectedRow(character : StarWarsCharacter, indexPath : NSIndexPath) {
        
        delegate?.starWarsViewController(self, didSelectCharacter: character)
        
        NSNotificationCenter.defaultCenter().postNotificationName(Constants().CHARACTER_CHANGE_NOTIFICATION, object: nil, userInfo: [Constants().CHARACTER_KEY : character ]);
        
        NSUserDefaults.standardUserDefaults().setObject([indexPath.section, indexPath.row], forKey: Constants().LAST_CHARACTER_SELECTED)
    }
    
    
}
