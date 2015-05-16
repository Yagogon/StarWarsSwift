//
//  StarWarsUniverse.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 12/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit

class StarWarsUniverse: NSObject {
    
    private var rebels : Array<StarWarsCharacter> = []
    private var imperials : Array<StarWarsCharacter> = []
    
    var rebelsCount : Int {
        get{
            return self.rebels.count
        }
    }
    
    var imperialsCount : Int {
        get{
            return self.imperials.count
        }
    }
    
    // MARK: Init
    
    override init() {
        
        let bundle = NSBundle.mainBundle()
        
        
        if let soundURL = bundle.URLForResource("vader", withExtension: "caf"),
            let sound = NSData(contentsOfURL: soundURL),
            let wikiURL = NSURL(string: "http://es.wikipedia.org/wiki/Darth_Vader"),
            let image = UIImage(named: "darthVader.jpg") {
                
                imperials.append(StarWarsCharacter(name: "Anakin Skylwaker",
                    alias: "Darth Vader",
                    photo: image,
                    sound: sound,
                    wikiURL: wikiURL))
        }
        
        if let soundURL = bundle.URLForResource("chewbacca", withExtension: "caf"),
            let sound = NSData(contentsOfURL: soundURL),
            let wikiURL = NSURL(string: "http://es.wikipedia.org/wiki/Chewbacca"),
            let image = UIImage(named: "chewbacca.jpg") {
                
                rebels.append(StarWarsCharacter(alias: "Chewbacca",
                    photo: image,
                    sound: sound,
                    wikiURL: wikiURL))
        }
        
        //c3po
        
        if let soundURL = bundle.URLForResource("c3p0", withExtension: "caf"),
            let sound = NSData(contentsOfURL: soundURL),
            let wikiURL = NSURL(string: "http://es.wikipedia.org/wiki/C-3PO"),
            let image = UIImage(named: "c3po.jpg") {
                
                rebels.append(StarWarsCharacter(alias: "C3P=",
                    photo: image,
                    sound: sound,
                    wikiURL: wikiURL))
        }
        
        
        
        // yoda
        if let soundURL = bundle.URLForResource("yoda", withExtension: "caf"),
            let sound = NSData(contentsOfURL: soundURL),
            let wikiURL = NSURL(string: "http://es.wikipedia.org/wiki/Yoda"),
            let image = UIImage(named: "yoda.jpg") {
                
                rebels.append(StarWarsCharacter(name : "Minch Yoda",
                    alias: "Master Yoda",
                    photo: image,
                    sound: sound,
                    wikiURL: wikiURL))
        }
        
        // Tarkin
        if let soundURL = bundle.URLForResource("tarkin", withExtension: "caf"),
            let sound = NSData(contentsOfURL: soundURL),
            let wikiURL = NSURL(string: "http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"),
            let image = UIImage(named: "tarkin.jpg") {
                
                imperials.append(StarWarsCharacter(name : "Wilhuf Tarkin",
                    alias: "Grand Moff Tarkin",
                    photo: image,
                    sound: sound,
                    wikiURL: wikiURL))
        }
        
        
        // Palpatine
        
        if let soundURL = bundle.URLForResource("palpatine", withExtension: "caf"),
            let sound = NSData(contentsOfURL: soundURL),
            let wikiURL = NSURL(string: "http://en.wikipedia.org/wiki/Palpatine"),
            let image = UIImage(named: "palpatine.jpg") {
                
                imperials.append(StarWarsCharacter(name : "Palpatine",
                    alias: "Darth Sidious",
                    photo: image,
                    sound: sound,
                    wikiURL: wikiURL))
        }
        
        
    }
    
    // MARK: Access Methods
    
    func rebelAtIndex(index : Int) -> StarWarsCharacter? {
        
        if rebelsCount > index {
            return self.rebels[index]
        }
        
        return nil
    }
    
    func imperialAtIndex(index : Int) -> StarWarsCharacter? {
        
        if imperialsCount > index {
            return self.imperials[index]
        }
        
        return nil
        
    }
    
    
}
