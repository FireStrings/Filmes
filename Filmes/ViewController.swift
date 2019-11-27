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
    
    
    @IBOutlet var txtDiretor: UITextField!
    @IBOutlet var txtAno: UITextField!
    @IBOutlet var txtTitulo: UITextField!
    @IBOutlet var txtGenero: UITextField!
//    func ret(){
//
//    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        print("Cheguei na classe")
     
        
       
//        let leo = context
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func insert(_ sender: UIButton) {
        insert()
    }
   
    @IBAction func voltar(_ sender: UIButton) {
        print("Voltando")
    }
    func insert(){
        
        if txtTitulo.text == "" && txtAno.text == "" && txtGenero.text == "" && txtDiretor.text == "" {
            let alertView = UIAlertController(title: "erro", message: "ERRO! Preencha todos os campos.", preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        }else{
            
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Filme", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            
            newUser.setValue(txtTitulo.text, forKey: "titulo")
            newUser.setValue(txtGenero.text, forKey: "genero")
            newUser.setValue(txtAno.text, forKey: "ano")
            newUser.setValue(txtDiretor.text, forKey: "diretor")
            
            txtTitulo.text = ""
            txtGenero.text = ""
            txtAno.text = ""
            txtDiretor.text = ""
            
            do {
                try context.save()
                
                let alertView = UIAlertController(title: "Sucesso", message: "Cadastro efetuado com sucesso!", preferredStyle: UIAlertControllerStyle.alert)
                alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertView, animated: true, completion: nil)
                
            } catch {
                print("Failed saving")
            }
        }
        
       print("Salvo")
        
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
