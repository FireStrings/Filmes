//
//  ConsultaViewController.swift
//  Filmes
//
//  Created by pos on 21/11/2019.
//  Copyright © 2019 pos. All rights reserved.
//

import UIKit
import CoreData

class ConsultaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! UITableViewCell
        var infoFilme = myarray[(indexPath.row)].characters.split{$0 == "_"}.map(String.init)
        cell.textLabel?.text = infoFilme[0]
        

        return cell
    }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath as IndexPath) as UITableViewCell
        var infoFilme = myarray[(indexPath.row)].characters.split{$0 == "_"}.map(String.init)
        cell.textLabel?.text = infoFilme[0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexpath = myarray[indexPath.row]
        print("indexpath:\(indexpath)")
        var infoFilme = myarray[(indexPath.row)].characters.split{$0 == "_"}.map(String.init)
        print(infoFilme)
        var alertView = UIAlertController(title: "\(infoFilme[0])", message: "Genero : \(infoFilme[1])\n"+"Ano : \(infoFilme[2])\nDiretor : \(infoFilme[3])\n", preferredStyle: UIAlertControllerStyle.alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
        
    }
   
    @IBOutlet var tableview: UITableView!
    var myarray = [String]()
    @IBOutlet var txtView: UITextView!
    @IBAction func consultar(_ sender: UIButton) {
        consulta();
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myarray.count
//    }
//
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath) as! UITableViewCell
//        cell.textLabel?.text = myarray[indexPath.item]
//        return cell
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Cheguei na classe")
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier:"customcell")
        
       //        let leo = context
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func voltar(_ sender: UIButton) {
        print("Voltando")
    }
    func consulta(){
        self.myarray = [String]()
        
        var res = ""
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Filme")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "titulo") as! String)
//                context.delete(data)
                myarray.append((data.value(forKey: "titulo") as! String) + "_" + (data.value(forKey: "genero") as! String) + "_" + (data.value(forKey: "ano") as! String) + "_" + (data.value(forKey: "diretor") as! String))
            
            }
//            try context.save()
//            txtView.text = res
            self.tableview.reloadData()
        } catch {
            
            print("Failed")
        }
    }
}
