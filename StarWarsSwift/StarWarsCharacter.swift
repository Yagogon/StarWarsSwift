//
//  StarWarsCharacter.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 12/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit

class StarWarsCharacter: NSObject {
    
    var name : String?
    var alias : String?
    var photo : UIImage
    var sound : NSData
    var wikiURL : NSURL
    
    // MARK: Init
    
    init( name : String?,alias : String?,photo : UIImage,sound : NSData, wikiURL : NSURL) {
        
        self.name = name
        self.alias = alias
        self.photo = photo
        self.sound = sound
        self.wikiURL = wikiURL
        
    }
    
    convenience init(name : String, photo : UIImage, sound : NSData, wikiURL : NSURL) {
        
        self.init(name: name, alias: nil, photo: photo, sound: sound, wikiURL: wikiURL);
        
    }
    
    convenience init(alias : String, photo : UIImage, sound : NSData, wikiURL : NSURL) {
        
        self.init(name: nil, alias: alias, photo: photo, sound: sound, wikiURL: wikiURL);
        
    }
    
}
