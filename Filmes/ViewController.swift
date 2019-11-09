//
//  ViewController.swift
//  Filmes
//
//  Created by pos on 08/11/2019.
//  Copyright © 2019 pos. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var retreieve: UIButton!
//    func ret(){
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        print("sadasdasdasdasdasdasdas")
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Pessoa", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("Leonardo", forKey: "nome")
        newUser.setValue("Lira", forKey: "sobrenome")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        print("OK1")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Pessoa")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "nome") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
        print("OK2")
//        let leo = context
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
