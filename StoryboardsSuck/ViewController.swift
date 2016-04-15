//
//  ViewController.swift
//  StoryboardsSuck
//
//  Created by Jeremy Petter on 2016-04-14.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Now that our view controller is appearing when we load the app, we need to set up our view controller. We can do this in
    // `viewDidLoad`. This method is called when the view is loaded, before it appears on the screen, so we can set things up here 
    // before anyone sees them.
    override func viewDidLoad() {
        super.viewDidLoad()

    // Remember, our view controller manages a view hierarchy. It comes with a "root" view by default, and we'll add other views on
    // top of it to create our layout

        view.backgroundColor = UIColor.greenColor() // First, we'll make our root view green

    // Then, we'll add another view, called `subview` as a child of that view. That view will float above its parent, so `subview` will
    // float above `view`. `subview` does not come with a view controller by default — it is a property that we create below (see 1️⃣)

        view.addSubview(subview)

    // When we created `subview`, it had a length, width, x and y of 0,0,0,0: meaning even though it's there, it's invisible because it
    // has no length and width. Let's set some constraint on it using "anchor notation":

    // Here we set the top edge of `subview` to be equal to the top edge of `view`, plus 100. On screen, it will appear 100 points south

        subview.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 100).active = true

    // We set the bottom edge to be equal to `view`'s top edge, minus 50: the bottom of the subview will be 50 pts north.

        subview.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -50).active = true

    // We do the same with the leading and trailing edges. For cultures that use left-to-right languages, the leading edges of views
    // are on the left. For right-to-left languages, the whole interface will be flipped, and the leading edges will be on the right.

        subview.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 50).active = true
        subview.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -50).active = true

    // This should be enough constraints to make our view appear, as it can now infer a length, width, x and y

    // Now let's add a button to our subview. A button is a subclass of UIView, so we can make `button` a child of `subview`. Again,
    // button is a property that we create lazily below (see 2️⃣)

        subview.addSubview(button)

    // Let's set some constraint for button. Its title label sets its width and height, so just need to set its x and y

        button.centerXAnchor.constraintEqualToAnchor(subview.centerXAnchor).active = true
        button.topAnchor.constraintEqualToAnchor(subview.topAnchor, constant: 50).active = true

    // Finally, we can tell our button what to do. Here, we tell it that when a user lifts their finger off the button (`UIControlEvent.TouchUpInside`)
    // that it should look in this file (`self`) for a selector (method, in this case) named "goNext" and execute that method (see 3️⃣)
        button.addTarget(self, action: #selector(goNext), forControlEvents: .TouchUpInside)
    }

    // 1️⃣ We'll declare our subviews as properties. Then they are stored in memory and we can refer to them again if we need to. I'm going to create
    // these as "lazy" variables. Lazy variables are `nil` until the first time they are accessed: when that happens,
    // they are created using the closure after the "=", then saved in that variable. After the first time they are used, they return the
    // saved value instead of creating one. This is different from a computed property, which uses the closure EVERY time the property is accessed.

    // Lazy loading has a few advantages here: 
    // 1.   It saves memory for views we never end up using, 
    // 2.   It makes sure all the setup code for our views is completed before they can be used
    // 3.   It groups the setup code for our views to that it's easy to find

    lazy var subview:UIView = {
        let subview = UIView() // This initializes the view with a width, height, x and y of 0. We will give it a size using constraints later

        subview.translatesAutoresizingMaskIntoConstraints = false // We have to set this for any view we want to use autolayout on
        subview.backgroundColor = UIColor.whiteColor() // Let's make our subview white, so we can see it against `view`, which is green

        return subview
    }() // A closure with "()" at the end (`{}()`) is executed once, immedaitely. A closure without "()" (`{}`) is meant to be saved and used later

    lazy var button:UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)

        return button
    }()

    // 3️⃣ goNext() creates a new view controller and tells the navigation controller to navigate to it

    func goNext() {
        let next = ViewController() // Here, we create another instance of _this_ view controller. It will have all the same properties set up as this one
        navigationController?.pushViewController(next, animated: true) // Now we "push" that view controller to the top of the navigation stack. We call the
                                                                       // top view controller of the navigation stack the "active" view controller. That's the
                                                                       // one we can see and interact with
    }

}

