//
//  ConsultaViewController.swift
//  Filmes
//
//  Created by pos on 21/11/2019.
//  Copyright © 2019 pos. All rights reserved.
//

import UIKit
import CoreData

class ConsultaViewController: UIViewController {
    
    @IBOutlet var txtView: UITextView!
    @IBAction func consultar(_ sender: UIButton) {
        consulta();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Cheguei na classe")
        
        
        
        //        let leo = context
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func voltar(_ sender: UIButton) {
        print("Voltando")
    }
    func consulta(){
        var res = ""
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Filme")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "titulo") as! String)
                
                res += (data.value(forKey: "titulo") as! String)
                res += ":"
                res += (data.value(forKey: "genero") as! String)
                res += "\n"
            }
            txtView.text = res
            
        } catch {
            
            print("Failed")
        }
    }
}
