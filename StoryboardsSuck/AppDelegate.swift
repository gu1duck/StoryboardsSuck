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

    // Before we are able to use the app without a storyboard, we need to do three things

    // 1.   👈 delete the storyboard file in the sidebar
    // 2.   👈 modify the `info.plist` file. This "property list" is like a dictionary that contains miscellaneous information that
    //      your app may need to know at various times. The "Main storyboard file base name" property tells the app which storyboard
    //      file it should look for when it starts up. We don't want it to look for ANY storyboard. Hover over and click on the `-`
    //      button to delete this property.
    // 3.   👇 Now that we've gotten rid of the storyboard, we need to tell the app what to do when is starts. The
    //      `applicationDidFinishLaunching...` method in the app delegate (this file) is for exactly this purpose: any time the app
    //      finishes launching, it will call this method to find out what to do. This is where we will set up our app's "window"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // There are three steps to getting our first view controller on the screen:
        // 1.   create a 'Window' to hold our app
        // 2.   put our first view controller into that window as its `root` view controller (the controller it starts on)
        // 3.   Make the window visible

        // 1. Initialize the window — this is like the windows that we use on the Mac, but iOS apps only ever have one window, and it _usually_
        // takes up the full screen (except when multi-tasking on iPad, for example)

        window = UIWindow(frame: UIScreen.mainScreen().bounds)

        // I'm setting the window's background colour to white so that we can see it

        window?.backgroundColor = UIColor.redColor()

        // 2. Here we create a view controller that is an instance of `ViewController.swift`. This is like dragging a ViewController onto our storyboard,
        // except it's already set up (because we will set it up in code in that file

        let viewController = ViewController()

        // Now we create a navigation controller and make the view controller we just created its "root" view controller. This is like when we dragged
        // a navigation controller onto our storyboard and connected it to a view controller

        let navigationController = UINavigationController(rootViewController: viewController)

        // Now, we set the navigation controller as the root view controller of the window. The arrow that shows our starting view controller on our
        // storyboard shows the root view controller of the window

        window?.rootViewController = navigationController

        // 3. Finally, we make the window our "key" window (if this were on a Mac, this would be the "active" window) and visible (it's hidden by default)
        
        window?.makeKeyAndVisible()

        // Now when out app starts, it will show an instance of `View Controller` embedded in a navigation controller.

        return true
    }

}

