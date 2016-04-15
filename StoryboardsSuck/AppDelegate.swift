//
//  AppDelegate.swift
//  StoryboardsSuck
//
//  Created by Jeremy Petter on 2016-04-14.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {


        // Initialize the window — this is like the windows that we use on the Mac, but iOS apps only ever have one window, and it _usually_
        // takes up the full screen (except when multi-tasking on iPad, for example)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        // I'm setting the window's background colour to white so that we can see it

        window?.backgroundColor = UIColor.redColor()

        // Here we create a view controller that is an instance of `ViewController.swift`. This is like dragging a ViewController onto our storyboard,
        // except it's already set up (because we will set it up in code in that file

        let viewController = ViewController()

        // Here we create a navigation controller and make the view controller we just created its "root" view controller. This is like when we dragged
        // a navigation controller onto our storyboard: remmeber, it started with a root view controller

        let navigationController = UINavigationController(rootViewController: viewController)

        // Now, we set the navigation controller as the root view controller of the window. The arrow that shows our starting view controller on our
        // storyboard shows the root view controller of the window

        window?.rootViewController = navigationController

        // Finally, we make the window our "key" window (if this were on a Mac, this would be the "active" window) and visible (it's hidden by default)
        
        window?.makeKeyAndVisible()

        return true
    }

    }

