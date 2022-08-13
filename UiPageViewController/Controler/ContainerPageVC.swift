//
//  ContainerPageVC.swift
//  UiPageViewController
//
//  Created by Ahmed Elmemy on 12/08/2022.
//

import UIKit

class ContainerPageVC: UIPageViewController , UIPageViewControllerDelegate , UIPageViewControllerDataSource {
 
    var pageControl = UIPageControl()
    

 
    var arrOfContainers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        
        vc1.pageImage = UIImage(named: "image1")
        vc1.pageDescription = "image1".localized
        
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        
        vc2.pageImage = UIImage(named: "image2")
        vc2.pageDescription = "image2".localized
        
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        
        vc3.pageImage = UIImage(named: "image3")
        vc3.pageDescription = "image3".localized
        
        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        
        vc4.pageImage = UIImage(named: "image4")
        vc4.pageDescription = "image4".localized
        
        let vc5 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        
        vc5.pageImage = UIImage(named: "image5")
        vc5.pageDescription = "image5".localized
        
        delegate = self
        dataSource = self
        
        arrOfContainers.append(vc1)
        arrOfContainers.append(vc2)
        arrOfContainers.append(vc3)
        arrOfContainers.append(vc4)
        arrOfContainers.append(vc5)
        
        
        if let firstVC = arrOfContainers.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
            
            addPageControl()
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

    guard let currentIndex = arrOfContainers.firstIndex(of: viewController) else{
        return nil
        
    }
    
    let perviousIndex = currentIndex - 1
    
    guard perviousIndex >= 0 else{
        return nil
        
    }
    
    return arrOfContainers[perviousIndex]
}
   

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arrOfContainers.firstIndex(of: viewController) else{
            return nil
        }
        let afterIndex = currentIndex + 1
        guard afterIndex < arrOfContainers.count  else{
            return nil
        }
        return arrOfContainers[afterIndex]
    }
    
 
    
    
    
    func addPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 150, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = arrOfContainers.count
        self.pageControl.currentPage = 0
//        self.pageControl.currentPage = arrOfContainers.count - 1
        self.pageControl.tintColor = .white
        self.pageControl.pageIndicatorTintColor = .gray
        self.pageControl.currentPageIndicatorTintColor = .black
        self.view.addSubview(pageControl)
    }


    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool,previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController=pageViewController.viewControllers![0]
       self.pageControl.currentPage=arrOfContainers.firstIndex(of:pageContentViewController)!
//        self.pageControl.currentPage = (arrOfContainers.count - 1) - arrOfContainers.firstIndex(of:pageContentViewController)!
    }
}
