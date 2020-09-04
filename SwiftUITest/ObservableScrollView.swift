//
//  ObservableScrollView.swift
//  TableScroll
//
//  Created by Diptiranjan Rout on 02/09/20.
//  Copyright © 2020 VINEETKS. All rights reserved.
//

import UIKit

public protocol ChildViewControllerViewSource: class {
    
    /**
     By default, ObservableScrollView will observe the default view of viewcontroller for content
     changes and makes the scroll effect. If you want to change the default view, implement
     ChildViewControllerViewSource and pass your custom view or use notification center for passing Views.
     
     - returns: observe view
     */
     func viewForChildControllerToObserveContentOffsetChange() -> UIView
}

/**
 Direction of using this custom scrollview class
 
 - Note:
 In view controller need to add value for 2 properties.
 1. `headerViewHeight`
 2. `headerViewOffsetHeight`
 Use `ChildViewControllerViewSource` to get scroll view from child view contolers.
 And call `addObserverFor()` of `ObservableScrollView` and pass that view in the method.
 
 */
class ObservableScrollView: UIScrollView {
    
    private var viewObservers = [UIView]()

    var observing = true
    var headerViewHeight: CGFloat = 0
    var headerViewOffsetHeight: CGFloat = 0
    var contentView: UIScrollView?
    

    fileprivate func initialSetup() {
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
        decelerationRate = UIScrollView.DecelerationRate.fast
        bounces = false
        
        addObserver(self, forKeyPath: "contentOffset",
                    options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.old],
                    context: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    deinit {
        removeObserver(self,
                            forKeyPath: "contentOffset",
                            context: nil)
        
        for view in viewObservers {
            view.removeObserver(self,
                                forKeyPath: "contentOffset",
                                context: nil)
        }
    }
    
    
    
    func addObserverFor(_ view: UIView) {
        viewObservers.append(view)
        view.addObserver(self, forKeyPath: "contentOffset",
                         options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.old],
                         context: nil)
    }
    
    func handleScrollUp(_ scrollView: UIScrollView,
                        change: CGFloat,
                        oldPosition: CGPoint) {

        if headerViewHeight != 0.0 && contentOffset.y != 0.0 {
            if scrollView.contentOffset.y < 0.0 {
                if contentOffset.y >= 0.0 {

                    var yPos = contentOffset.y - change
                    yPos = yPos < 0 ? 0 : yPos
                    let updatedPos = CGPoint(x: contentOffset.x, y: yPos)
                    setContentOffset(self, point: updatedPos)
                    setContentOffset(scrollView, point: oldPosition)
                }
            }
        }
    }

    func handleScrollDown(_ scrollView: UIScrollView,
                          change: CGFloat,
                          oldPosition: CGPoint) {
        
        let offset = (headerViewHeight - headerViewOffsetHeight)
        
        if contentOffset.y < offset {
            
            if scrollView.contentOffset.y >= 0.0 {
                
                var yPos = contentOffset.y - change
                yPos = yPos > offset ? offset : yPos
                let updatedPos = CGPoint(x: contentOffset.x, y: yPos)
                setContentOffset(self, point: updatedPos)
                setContentOffset(scrollView, point: oldPosition)
            }
        }
    }

    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        if !observing { return }

        let scrollView = object as? UIScrollView
        if scrollView == nil { return }
        if scrollView == self { return }

        let changeValues = change! as [NSKeyValueChangeKey: AnyObject]

        if let new = changeValues[NSKeyValueChangeKey.newKey]?.cgPointValue,
            let old = changeValues[NSKeyValueChangeKey.oldKey]?.cgPointValue {

            let diff = old.y - new.y

            if diff > 0.0 {

                handleScrollUp(scrollView!,
                                    change: diff,
                                    oldPosition: old)
            } else {

                handleScrollDown(scrollView!,
                                      change: diff,
                                      oldPosition: old)
            }
        }
    }

    func setContentOffset(_ scrollView: UIScrollView, point: CGPoint) {
        observing = false
        scrollView.contentOffset = point
        observing = true
    }
}
