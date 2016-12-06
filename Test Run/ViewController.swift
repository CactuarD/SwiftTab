//
//  ViewController.swift
//  Test Run
//
//  Created by ADMINISTRADORUTM on 05/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    var arreglo = [("Daniel","Hernandez"),("Casi","LF"),("Item","item2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arreglo.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let proto = (indexPath.row % 2 == 0) ? "Proto1" : "Proto2"
        
        let vista = tableView.dequeueReusableCell(withIdentifier: "Proto1", for: indexPath) as! TableViewCell
        
        if indexPath.row % 2 == 0 {
            vista.lblIzquierda.text = arreglo[indexPath.row].0
            vista.lblDerecha.text = arreglo[indexPath.row].1
        }
        else {
            vista.lblDerecha.text = arreglo[indexPath.row].0
            vista.lblIzquierda.text = arreglo[indexPath.row].1
        }
        return vista
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Fila \(indexPath.row)")
    }
    
}



