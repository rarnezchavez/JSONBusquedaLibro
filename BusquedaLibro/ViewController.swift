//
//  ViewController.swift
//  BusquedaLibro
//
//  Created by Roberto Arnez on 7/30/16.
//  Copyright © 2016 Roberto Arnez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numeroISBNLibro: UITextField!
    
    @IBOutlet weak var resultadoBusquedaISBN: UITextView!
    
    
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelAutores: UILabel!
    @IBOutlet weak var labelPortada: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sincrono() {
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(numeroISBNLibro.text!)"
        let url = NSURL(string: urls)
        //Nuevo codigo
        let datosDos = NSData(contentsOfURL: url!)
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(datosDos!, options: NSJSONReadingOptions.MutableLeaves)
            let dico1 = json as! NSDictionary
            let dico2 = dico1["ISBN:\(numeroISBNLibro.text!)"] as! NSDictionary
            let dico3 = dico2["authors"] as! NSArray
        
            
            self.labelTitulo.text = dico2["title"] as! NSString as String
            self.labelAutores.text = dico3[0]["name"] as! NSString as String
            self.labelPortada.text = dico2["by_statement"] as! NSString as String
        }
        catch _ {
            
        }
        
        	
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding )
        resultadoBusquedaISBN.text = String(texto)
    }
    
    
    @IBAction func botonClear(sender: AnyObject) {
        numeroISBNLibro.text = " "
        resultadoBusquedaISBN.text = " "
        labelTitulo.text = " "
        labelAutores.text = " "
        labelPortada.text = " "
    }
    
    
    @IBAction func botonSearch(sender: AnyObject) {
        sincrono()
    }
}

