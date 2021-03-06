//
//  MyPostsTableViewController.swift
//  FriendClub
//
//  Created by Michael Aubie on 2017-10-26.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//
import UIKit
import CoreLocation

class MyPostsTableViewController: UITableViewController, NewPostViewControllerDelegate {
    var myPosts:[Post] = []
    var currentUser:Friend!
    var dataModel: DataModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = dataModel.currentUser
        currentUser.posts.map({ myPosts.append($0)})
        print("my posts = ", myPosts.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPostItem", for: indexPath)
        let item = myPosts[indexPath.row]
        //1000 = title
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.title
        //2000 = text content
        let contentText = cell.viewWithTag(2000) as!UITextView
        contentText.text = item.content
        //3000 = post image
        let postImage = cell.viewWithTag(3000) as!UIImageView
        postImage.image = item.image
        //4000 = post date
        let postDate = cell.viewWithTag(4000) as! UILabel
        postDate.text = item.dateCreated.description
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewPostSegue" {
            let navigationController =
                segue.destination as! UINavigationController
            let controller = navigationController.topViewController as!
                NewPostViewController
            controller.delegate = self
        } else if segue.identifier == "editItemSegue" {
    //        let navigationController =
    //            segue.destination as! UINavigationController
    //        let controller = navigationController.topViewController as!
    //        ItemDetailViewController
    //        controller.delegate = self
    //        controller.creatureCategory = category
    //        if let indexPath = tableView.indexPath(
    //            for: sender as! UITableViewCell) {
    //            controller.creatureToEdit = creatures[indexPath.row]
    //            controller.title = creatures[indexPath.row].title
    //        }
        }
    }
       
    func newPostViewController(_ controller: NewPostViewController, didFinishAdding post: Post) {
        let newRowIndex = myPosts.count
        dataModel.addUserPost(newPost: post, user: getCurrentUser())
        myPosts.append(post)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        FcApi.sendNewPost(post: post)
    }
    
    func newPostViewController(_ controller: NewPostViewController, didFinishEditing post: Post) {
        ///
    }
        
    func newPostViewControllerDidCancel(_ controller: NewPostViewController) {
            
    }
    
    func getCurrentUser() -> Friend {
        return currentUser!
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
