//
//  CategoryViewController.swift
//  toDoList
//
//  Created by Apple on 7/9/25.
//

import UIKit
import CoreData
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigaation does not exist")}
        navBar.backgroundColor = UIColor(hexString: "1D9BF6")
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : ContrastColorOf(UIColor.black, returnFlat: true)]

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        guard let categoryColour = UIColor(hexString: categories[indexPath.row].colour!) else {fatalError()}
        cell.backgroundColor = categoryColour
        cell.textLabel?.textColor = ContrastColorOf(categoryColour, returnFlat: true)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    func saveCategories() {
        
        do {
            try context.save()
        } catch {
            print("error\(error)")
        }
        
        tableView.reloadData()
    
    }
    func loadCategories() {
        
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error\(error)")
        }
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        self.context.delete(self.categories[indexPath.row])
        do {
            try self.context.save()
            self.categories.remove(at: indexPath.row)
        } catch {
            print("Error saving context after deletion: \(error)")
        }
    }


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New CAtegory", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCotegory = Category(context: self.context)
            newCotegory.name = textField.text!
            newCotegory.colour = UIColor.randomFlat().hexValue()
            self.categories.append(newCotegory)
            self.saveCategories()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
            field.placeholder = "Add New Category"
        }
        present(alert, animated: true, completion: nil)
    }
}

