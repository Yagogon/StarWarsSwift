//
//  AppDelegate.swift
//  StarWarsSwift
//
//  Created by Yago de la Fuente on 12/5/15.
//  Copyright (c) 2015 cinnika. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Crear la UIWindow
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let model = StarWarsUniverse()
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            configureForPad(model)
        } else {
            configureForPhone(model)
        }
        
        // Mostrarlo
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func configureForPad(model : StarWarsUniverse) {
        
        // Creamos los controladores
        // Crear el controlador
        var tableVC = StarWarsUniverseTableViewController(style : UITableViewStyle.Plain, model: StarWarsUniverse())
        
        var nav = UINavigationController(rootViewController: tableVC)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var characterSelected : StarWarsCharacter?
        if let coords = defaults.objectForKey(Constants().LAST_CHARACTER_SELECTED) as? Array<Int>,
            let character = characterWithIndexPath(NSIndexPath(forItem: coords[1], inSection: coords[0]),
                universe: model){
                    
                characterSelected = character
                    
        } else {
            characterSelected = model.rebelAtIndex(0)
        }
        
        if let character = characterSelected {
            
            var charVC = StarWarsCharacterViewController(nibName: "StarWarsCharacterViewController", bundle: nil, character: character)
            
            var charNav = UINavigationController(rootViewController: charVC)
            
            // Creo el combinador
            var splitVC = UISplitViewController()
            splitVC.viewControllers = [nav, charNav]
            
            // Asignamos delegados
            splitVC.delegate = charVC;
            tableVC.delegate = charVC;
            
            // Asignarlo como root
            window?.rootViewController = splitVC
            
        }
        
    }
    
    func configureForPhone(model : StarWarsUniverse) {
        
        // Crear el controlador
        var vc = StarWarsUniverseTableViewController(style : UITableViewStyle.Plain, model: StarWarsUniverse())
        
        vc.delegate = vc;
        // Navigation
        var nav = UINavigationController(rootViewController: vc)
        
        // Asignarlo como root
        window?.rootViewController = nav
        
    }
    
    func characterWithIndexPath(indexPath : NSIndexPath, universe : StarWarsUniverse) -> StarWarsCharacter? {
        
        if indexPath.section == Constants().IMPERIAL_INDEX {
            return universe.imperialAtIndex(indexPath.row)
        }
        
        return universe.rebelAtIndex(indexPath.row)
    }
    
    
}

