//
//  ViewController.swift
//  SwiftAssessment
//
//  Created by MOHAMMED IMRAN on 2/7/19.
//  Copyright © 2019 MOHAMMED IMRAN. All rights reserved.
//

import UIKit

/**
 The purpose of the ViewController is to display the list of TopNews with title on the  UITableView.
 
 /// - Fetch the Data by making API call
 /// - Displaying the data in the TableView like Thumbnail and Title.
 
 */


class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet var NewsTableView: UITableView!
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    var viewModel: ViewModel?

    var searchMode = false
    let searchBar = UISearchBar()
    
    var filteredSearchResultList : [News]? = nil
    
    var listdataSource = [News](){
        didSet {
            self.NewsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Configure Search Bar
        searchBar.showsCancelButton = true
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        setUpUI()
    
    }

    func setUpUI() {
        
        /// TableView Header title
        //self.title = "Popular News"
        
        self.title = "TITLE".localized(withComment: "Screen Title")
        
        /// Registering the customCell with NewsTableViewCell.
        self.NewsTableView.register(UINib(nibName: String(describing: NewsTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: NewsTableViewCell.self))
        
        /// NewsTableViewCell with default height.
        self.NewsTableView.estimatedRowHeight = 70.0
        
        /// ActivityIndicator start animating to show the info to webservice call.
        loadingIndicator.startAnimating()
        
        /// The ViewModel to make the service call to get the datasource
        self.viewModel = ViewModel()
        /// The Delegate method to get the service response.
        self.viewModel?.viewModelDelegate = self as ViewModelDelegate

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == String(describing: DetailViewController.self) ,let destination = segue.destination as? DetailViewController{
            let row = (sender as! IndexPath).row
            destination.detailItem = self.listdataSource[row]
        }
    }
    
    
    @IBAction func didTapSearchButtonItem(_ sender: Any) {
        
        if self.searchMode == true {
            searchBarCancelButtonClicked(self.searchBar)
            return
        }
        self.filteredSearchResultList = self.listdataSource
        self.searchMode = true
        self.NewsTableView.tableHeaderView = searchBar
        searchBar.sizeToFit()
        searchBar.becomeFirstResponder()
    }
    
    // MARK: - Search Bar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchMode = false
        searchBar.resignFirstResponder()
        self.NewsTableView.tableHeaderView = nil
        self.NewsTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filteredSearchResultList = viewModel?.filterBySearchKeywords(searchKeyword: searchText, resultsArray: self.listdataSource)
        
        self.NewsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }

}

//MARK:-  UITableView Delegate Methods
extension ViewController: UITableViewDelegate {
    
    /// This is the description for a method.
    /// Returns: heightForRow.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    /// This get the selected row.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: String(describing: DetailViewController.self), sender: indexPath)
    }
    
}

//MARK:-  UITableView DataSource Methods
extension ViewController: UITableViewDataSource {
    
    /// Returns: number of sections.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Returns: number of rows.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.searchMode && self.filteredSearchResultList != nil {
            return (self.filteredSearchResultList?.count)!
        }
        
        if self.searchMode == false && self.listdataSource.count>0 {
            return (self.listdataSource.count)
        }
        
        return 0
    }
    
    /// Returns: This method returns the cell informations like duration and risetime.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableViewCell.self), for: indexPath) as! NewsTableViewCell
        
        if self.searchMode && self.filteredSearchResultList != nil {
            cell.configureCell(newsInfo: self.filteredSearchResultList![indexPath.row])
        }
        
        if self.searchMode == false && self.listdataSource.count>0 {
            cell.configureCell(newsInfo: self.listdataSource[indexPath.row])
        }
        
        return cell
    }

    
}


//MARK: API Service Request and getting data from the viewModel
extension ViewController: ViewModelDelegate {
    
    /// This method gets call on successsful response
    /// - Returns: It recieves Newslist from the response.
    /// - Returns: Failed method gets call on empty Newslist.
    func didReceiveNews() {
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.hidesWhenStopped = true
        if let newdata = self.viewModel?.Newsdata
        {
            self.listdataSource = newdata.results!
        }
    }
    
    /// Base Service Protocols are been implemented based on the error
    func didFailed(){
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.hidesWhenStopped = true
        
        self.alert(message: "NO_INTERNET".localized(withComment: "NO_INTERNET"), title:"APP_NANE".localized(withComment: "APP_NANE"))
    }
    
}

extension UIViewController {
    
    func alert(message: String, title: String ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


