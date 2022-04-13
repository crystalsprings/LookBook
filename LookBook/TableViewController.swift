//
//  TableViewController.swift
//  LookBook
//
//  Created by Janice Flint on 4/11/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var deck = [NSDictionary]()
//    var include = [String]()
    var dateModified = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDeck()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return deck.count
    }
 
    
    func initializeDeck() {
        if UserDefaults.standard.object(forKey: "deck") != nil {
            deck = UserDefaults.standard.array(forKey: "deck") as! Array
            dateModified = UserDefaults.standard.object(forKey: "dateModified") as! Date
            //print("Deck",deck)
        }
        else {
            deck = [[
            "formalName" : "ADHITA SELVARAJ",
            "nickName" : "Adhita",
            "title" : "Software Engineer",
            "bio" :"Adhita Selvaraj (he/him) is a Software Engineer in ML Infrastructure. His expertise is in building developer tooling and platforms for Data Scientists. Prior to Viaduct, he worked at Cisco where he was building Kubeflow in OSS and into Cisco products. He has a Master's degree from Stony Brook where he started contributing to Cloud Native OSS projects.",
            "image" : "adhita.png",
            "include" : "Yes"
            ], [
                "formalName" : "ALJAŽ KOŠMERLJ",
                "nickName" : "Aljaz",
                "title" : "Data Scientist",
                "bio" :"Aljaž is a Data Scientist at Viaduct. He holds a PhD in Artificial Intelligence from the University of Ljubljana. Before joining Viaduct he worked as a Researcher at the Jožef Stefan Institute in Ljubljana on applied AI projects with a focus on Stream Learning and Natural Language Processing. Besides research projects, he developed solutions for Bloomberg LP and the Slovenian Ministry of Justice. ",
                "image" : "aljaz.png",
                "include" : "Yes"
            ], [
                "formalName" : "AMIRMEHDI SHARIFZAD",
                "nickName" : "Amir",
                "title" : "Data Scientist",
                "bio" :"Amirmehdi has recently graduated from the University of Waterloo with a major in Computer Science and a focus on Machine Learning and Deep Learning. He has worked on various Data Science projects as an intern throughout his undergraduate. Prior to joining Viaduct he worked on state-of-the-art Neural Machine Translation and Natural Language Processing research at Huawei's Noah's Ark Lab.",
                "image" : "amirmehdi.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
            ], [
                "formalName" : "BORA UYUMAZTURK",
                "nickName" : "Bora",
                "title" : "Product Manager",
                "bio" :"Bora is a Product Manager at Viaduct. He specializes in statistical and mathematical modeling. Previously, he was a research assistant in the Stanford Machine Learning Group, where he published research at the intersection of artificial intelligence and medicine. In addition to research, he’s also taught machine learning concepts as a course assistant at deeplearning.ai. He holds an MS in computer science and a BS in mathematics, both from Stanford University.",
                "image" : "bora.png",
                "include" : "Yes"
           ]]
            dateModified = Date()
            UserDefaults.standard.set(dateModified, forKey: "dateModified")
            UserDefaults.standard.set(deck, forKey: "deck")
            print(deck)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let personInfo = deck[indexPath.row]
        cell.textLabel?.text = personInfo["formalName"] as! String?
        if personInfo["include"] as! String == "Yes" {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
