//
//  ViewController.swift
//  defaults-are-fun
//
//  Created by Mostafijur Rahaman on 6/25/16.
//  Copyright © 2016 Mostafijur Rahaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favLbl: UILabel!
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String{
            favLbl.text = "Favorite color: \(color)"
        }else{
            favLbl.text = "Pick a color"
        }
        
        let personA = Person(firstName: "Mostafijur", lastName: "Rahaman")
        let personB = Person(firstName: "Jannatul", lastName: "Ferdous")
        let personC = Person(firstName: "Mahibur", lastName: "Rahman")
        
        people.append(personA)
        people.append(personB)
        people.append(personC)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func red(sender: AnyObject) {
        favLbl.text = "Favorite color: Red"
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    @IBAction func yellow(sender: AnyObject) {
        favLbl.text = "Favorite color: Yellow"
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func blue(sender: AnyObject) {
        favLbl.text = "Favorite color: Blue"
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadedPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData{
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedPeople) as? [Person]{
                for person in peopleArray{
                    print("\(person.firstName) \(person.lastName)")
                }
            }
        }
    }
}

