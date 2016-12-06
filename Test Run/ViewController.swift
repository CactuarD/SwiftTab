//
//  ViewController.swift
//  Test Run
//
//  Created by ADMINISTRADORUTM on 05/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetalleViewControllerDelegate, AgregarViewControllerDelegate{

    var esEdicion = false
    
    var datos = [("Dan",24),("Sam",15),("Mill",25),("John",23)]
    
    var filaSeleccionada = -1
    
    @IBOutlet weak var Tabla: UITableView!
    
    @IBAction func btnAdd(_ sender: Any) {
        performSegue(withIdentifier: "AgregarSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //MARK: - UIView Delegates
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "labelSegue":
            let view = segue.destination as! DetalleViewController
            
            view.numeroFila = filaSeleccionada
            view.dato = datos [filaSeleccionada].0
            view.datoNumero = datos [filaSeleccionada].1
            
            view.delegado = self
            break
        case "AgregarSegue":
            let view = segue.destination as! AgregarViewController
            
            if (esEdicion) {
                view.Fila = filaSeleccionada
                view.Nombre = datos[filaSeleccionada].0
                view.Edad = datos[filaSeleccionada].1
                esEdicion = false
            }
            
            view.delegado = self
            break
        default:
            break
        }
        
        
    }
    
    func NumeroCambiado(numero : Int) {
        print("Numero cambiado \(numero)")
        
        datos[numero].1 = datos[numero].1 + 1
        
        Tabla.reloadData()
    }
    
    //MARK: -TableViewDelegates
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return datos.count
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let eliminar =  UITableViewRowAction(style: .destructive, title: "Borrar", handler: borrarFila)
        let editar = UITableViewRowAction(style: .normal, title: "Editar", handler: editarFila)
        
        return [eliminar, editar]
    }
    
    func borrarFila (sender:UITableViewRowAction, indexPath : IndexPath) {
        datos.remove(at: indexPath.row)
        Tabla.reloadData()
    }
    
    func editarFila (sender:UITableViewRowAction, indexPath : IndexPath) {
        esEdicion = true
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "AgregarSegue", sender: sender)
        Tabla.reloadData()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let proto = (indexPath.row % 2 == 0) ? "Proto1" : "Proto2"
        
        let vista = tableView.dequeueReusableCell(withIdentifier: proto, for: indexPath) as! TableViewCell
        
        if indexPath.row % 2 == 0 {
            vista.lblIzquierda.text = datos[indexPath.row].0
            vista.lblDerecha.text = String(datos[indexPath.row].1)

        }
        else {
            vista.lblCentral.text = datos[indexPath.row].0
        }
        return vista
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Fila \(indexPath.row)")
        
        //detalle segue
        filaSeleccionada = indexPath.row
        performSegue(withIdentifier: "labelSegue", sender: self)
    }
    
    func agregarRegistro(nombre: String, edad: Int, fila: Int) {
        datos.append((nombre,edad))
        Tabla.reloadData()
    }
    
}



