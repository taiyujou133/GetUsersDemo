//
//  GetUsersTableViewController.swift
//  GetUsersDemo
//
//  Created by Tai on 2022/10/21.
//

import UIKit
import Kingfisher

class GetUsersTableViewController: UITableViewController {
    var items = [GetUsers]()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchUsersInfo()
    }
    
    func fetchUsersInfo() {
        
        let url = URL(string: "https://reqres.in/api/users?page=2")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let decode = try decoder.decode(GetUsers.self, from: data)
                    self.items = [decode]

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ShowDetailTableViewCell.self)", for: indexPath) as! ShowDetailTableViewCell

        // Configure the cell...
        let item = items[indexPath.row]
//        item.data.forEach { index in
        cell.firstNameLabel.text = item.data[indexPath.row].firstName
        cell.lastNameLabel.text = item.data[indexPath.row].lastName
        cell.emailLabel.text = item.data[indexPath.row].email
        cell.showImage.kf.setImage(with: item.data[indexPath.row].avatar)
//        }

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
