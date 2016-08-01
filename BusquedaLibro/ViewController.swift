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
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding )
        resultadoBusquedaISBN.text = String(texto)
    }
    
    
    @IBAction func botonClear(sender: AnyObject) {
        numeroISBNLibro.text = " "
        resultadoBusquedaISBN.text = " "
    }
    
    
    @IBAction func botonSearch(sender: AnyObject) {
        sincrono()
    }
}

