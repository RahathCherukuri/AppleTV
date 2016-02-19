/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The application-specific delegate class.
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        // Add a search view controller to the root `UITabBarController`.
        if let tabController = window?.rootViewController as? UITabBarController {
            tabController.viewControllers?.append(packagedSearchController())
        }
        
        return true
    }

    /*
        When the user clicks a Top Shelf item, the application will be asked
        to open the associated URL.
    */
    func application(app: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        print("Application launched with URL: \(url)")
        return true
    }
    
    // MARK: Convenience
    
    /*
         A method demonstrating how to encapsulate a `UISearchController` for presentation in, for example, a `UITabBarController`
    */
    func packagedSearchController() -> UIViewController {
        // Load a `SearchResultsViewController` from its storyboard.
        let storyboard = UIStoryboard(name: "ViewControllerSamples", bundle: nil)
        guard let searchResultsController = storyboard.instantiateViewControllerWithIdentifier(SearchResultsViewController.storyboardIdentifier) as? SearchResultsViewController else {
            fatalError("Unable to instatiate a SearchResultsViewController from the storyboard.")
        }
        
        /*
            Create a UISearchController, passing the `searchResultsController` to
            use to display search results.
        */
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = searchResultsController
        searchController.searchBar.placeholder = NSLocalizedString("Enter keyword (e.g. iceland)", comment: "")
        
        // Contain the `UISearchController` in a `UISearchContainerViewController`.
        let searchContainer = UISearchContainerViewController(searchController: searchController)
        searchContainer.title = NSLocalizedString("Search", comment: "")
        
        // Finally contain the `UISearchContainerViewController` in a `UINavigationController`.
        let searchNavigationController = UINavigationController(rootViewController: searchContainer)
        return searchNavigationController
    }
}
