//
//  AgregarViewController.swift
//  Test Run
//
//  Created by ADMINISTRADORUTM on 06/12/16.
//  Copyright © 2016 Integra IT. All rights reserved.
//

import UIKit

protocol AgregarViewControllerDelegate {
    func agregarRegistro(nombre : String, edad : Int)
    func modificarRegistro(nombre : String, edad : Int, fila : Int)
}

class AgregarViewController: UIViewController {

    @IBOutlet weak var txtNom: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    var delegado : AgregarViewControllerDelegate? = nil
    var Nombre = ""
    var Edad = 0
    var Fila = -1
    
    
    @IBAction func btnSave(_ sender: Any) {
        if delegado != nil {
            if (txtNom.text != nil && (txtNom.text?.characters.count)! > 0) && (txtEdad.text != nil && (txtEdad.text?.characters.count)! > 0) {
                delegado?.agregarRegistro(nombre: txtNom.text!, edad: Int(txtEdad.text!)!)
                
                self.navigationController!.popViewController(animated: true)
                
                if Fila == -1 {
                    delegado?.agregarRegistro(nombre: txtNom.text!, edad: Int(txtEdad.text!)!)
                }
                else {
                    delegado?.modificarRegistro(nombre: txtNom.text!, edad: Int(txtEdad.text!)!, fila: Fila)
                }
                
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Nombre incorrecto o campo vacio", preferredStyle: .actionSheet)
                
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) in })
                
                let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(UIAlertAction) in self.navigationController!.popViewController(animated: true)})
                
                alert.addAction(cancelAction)
                alert.addAction(defaultAction)
                    present(alert, animated: true, completion: {} )
            }
        }
        //txtEdad.text = nil
        //txtNom.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNom.text = Nombre
        txtEdad.text = "\(Edad)"
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
