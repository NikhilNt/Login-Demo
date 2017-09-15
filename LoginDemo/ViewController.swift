//
//  ViewController.swift
//  LoginDemo
//
//  Created by Nikhil Tanappagol on 7/23/17.
//  Copyright © 2017 Nikhil Tanappagol. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var textFiled: UITextField!
    @IBOutlet var label: UILabel!
    
    @IBAction func loginAction(_ sender: UIButton) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context  = appDelegate.persistentContainer.viewContext
        
        let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users" ,into: context)
        
        newValue.setValue(textFiled.text, forKey: "name")
        do {
            try context.save()
            textFiled.alpha = 0
            label.alpha = 1
            label.text = "Hi There " + textFiled.text! + "!"
        } catch {
            print("Failed to save ")
            
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request  = NSFetchRequest< NSFetchRequestResult >(entityName: "Users")
    
       //  request.returnObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                if let username = result.value ( forKey: "name") as? String {
                    textFiled.alpha = 0
                     //loginActionButton.alpha = 0
                    label.alpha = 1
                    
                    label.text = "Hi There " + username + "1"
                }
            }
                } catch {
                    
                    print ("Error has occured ")
                    
                }
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

