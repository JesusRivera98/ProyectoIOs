//
//  ViewControllerMuestraPaciente.swift
//  heartPressureApp
//
//  Created by Alumno on 10/2/19.
//  Copyright © 2019 Isabela Escalante. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class ViewControllerMuestraPaciente: UIViewController {
    
    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbEdad: UILabel!
    @IBOutlet weak var lbPeso: UILabel!
    @IBOutlet weak var lbTalla: UILabel!
    
    var db: Firestore!
    var listaNombres = [String] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        db = Firestore.firestore()

        // Do any additional setup after loading the view.
    }
    
    func getInformation() {
        // [START get_collection]
        /*db.collection("pacientes").document(documentName).getDocument(){
         (querySnapshot, err) in
         }
         
         */
        db.collection("pacientes").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    self.lbNombre.text = "\(document.get("Nombre") ?? "no value")"
                    self.lbEdad.text = "\(document.get("Edad") ?? "no value")"
                    self.lbPeso.text = "\(document.get("Peso") ?? "no value")"
                    self.lbTalla.text = "\(document.get("Talla") ?? "no value")"
                    self.listaNombres.append("\(document.get("Nombre") ?? "no value")")
                    //print("\(document.get("Nombre") ?? "no value")")
                    //print("\(document.documentID) => \(document.get("nombre") ?? "no value")")
                    //print("\(document.get("Medicion") ?? "no value")")
                    
                }
            }
        }
        // [END get_collection]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
