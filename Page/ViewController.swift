//
//  ViewController.swift
//  Page
//
//  Created by Edward Mtshweni on 2018/06/13.
//  Copyright © 2018 Edward Mtshweni. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private var colors: [UIColor] = [.red, .blue]
    private var names: [String] = [".red", ".blue"]
    private var index:Int = 0
    private var sheduleViewController:SheduleViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.setViewController(index: index)
    }
    
    func setViewController(index:Int)  {
        guard let view = getViewControllerAtIndex(index: index) else {
            return
            }
        self.setViewControllers([view] as [UIViewController], direction: .forward, animated: false, completion: nil)
    }
   
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
        sheduleViewController?.name = names[index]
        self.index = index
        return sheduleViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


