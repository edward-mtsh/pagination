//
//  ViewController.swift
//  Page
//
//  Created by Edward Mtshweni on 2018/06/13.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    private var colors: [UIColor] = [.white, .white]
    private var redNames: [String] = [".red1", ".red2"]
    private var blueNames: [String] = [".blue1", ".blue2"]
    private var index:Int = 0
    private var sheduleViewController:SheduleViewController?
    private var paginationViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paginationViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        paginationViewController?.dataSource = self
        paginationViewController?.view.frame = view.bounds
        paginationViewController?.view.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height + 37)

        let initialViewController: SheduleViewController? = getViewControllerAtIndex(index: 0)
        let viewControllers = [initialViewController]
        paginationViewController?.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: false) { _ in }
        addChildViewController(paginationViewController!)
        view.addSubview(paginationViewController!.view)
        paginationViewController?.didMove(toParentViewController: self)
        self.view.bringSubview(toFront: segmentedControl)
    }
    
    @IBAction func tapped(_ sender: Any) {
        self.index = 0
        let initialViewController: SheduleViewController? = getViewControllerAtIndex(index: segmentedControl.selectedSegmentIndex)
        let viewControllers = [initialViewController]
        paginationViewController?.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: false) { _ in }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        self.index -= 1
        return getViewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        self.index += 1
        return getViewControllerAtIndex(index: index)
    }
    
    func getViewControllerAtIndex(index:Int) -> SheduleViewController? {
        sheduleViewController = SheduleViewController(nibName: "SheduleViewController", bundle: nil)
        sheduleViewController?.view.backgroundColor = colors[index]
        sheduleViewController?.name = segmentedControl.selectedSegmentIndex == 0 ? redNames[index] : blueNames[index]
        self.index = index
        return sheduleViewController
    }
}


