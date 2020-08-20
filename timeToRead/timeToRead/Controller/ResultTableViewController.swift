//
//  ResultTableViewController.swift
//  timeToRead
//
//  Created by Cecilia Soares on 18/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import UIKit

class ResultTableViewController: UITableViewController {

    @IBOutlet var resultTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTable.backgroundColor = .backgroundColor
        resultTable.contentInset.top = 10
        
        resultTable.register(UINib.init(nibName: ChartCellTableViewCell.xibName, bundle: nil), forCellReuseIdentifier: ChartCellTableViewCell.identifier)
        resultTable.register(UINib.init(nibName: ResultButtomTableViewCell.xibName, bundle: nil), forCellReuseIdentifier: ResultButtomTableViewCell.identifier)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        
        title.frame = CGRect(x: 16, y: 3, width: 375, height: 30)
        view.addSubview(title)
        title.font = .systemFont(ofSize: 24, weight: .semibold)
        title.textColor = .textColor
        switch section {
        case 0:
            title.text = "Progresso da leitura"
        case 1:
            title.text = "Dados Adicionais"
        default:
            title.text = ""
        }
       
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        default:
            return 4
        }

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ChartCellTableViewCell.identifier, for: indexPath) as! ChartCellTableViewCell
            return cell
            
        }else{
            
            let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
            //          seta que a label expanda até o maximo
            cell.textLabel?.numberOfLines = .max
            cell.backgroundColor = .backgroundColor
            cell.textLabel?.font = .systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.textColor = .textColor
            
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Tempo de leitura"
            case 1:
                cell.textLabel?.text = "lendo 30 páginas por dia você terminará em 10 dias "
            case 2:
                cell.textLabel?.text = "Duração do livro"
            case 3:
                let cellButton = tableView.dequeueReusableCell(withIdentifier: ResultButtomTableViewCell.identifier, for: indexPath) as! ResultButtomTableViewCell
                return cellButton

            default:
                cell.textLabel?.text = ""
        }
            return cell

        }
   
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
