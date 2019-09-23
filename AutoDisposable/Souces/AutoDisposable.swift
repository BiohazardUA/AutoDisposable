//
//  AutoDisposable.swift
//  AutoDisposable
//
//  Created by v.ternovskyi on 9/18/19.
//  Copyright © 2019 Vladyslav Ternovskyi. All rights reserved.
//

import RxSwift

public protocol AutoDisposable: class {
    
    /// You must dispose these subscribtions from  place where you need. `deinit` method should be a good place.
    var subscriptions: [Disposable] { get set }
}

public class AutoDisposableController: UIViewController, AutoDisposable {
    
    public var subscriptions = [Disposable]()
    
    deinit {
        subscriptions.forEach { $0.dispose() }
    }
}

public class AutoDispose: AutoDisposable {
    
    public var subscriptions = [Disposable]()
    
    deinit {
        subscriptions.forEach { $0.dispose() }
    }
}

