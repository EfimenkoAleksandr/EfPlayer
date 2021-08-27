//
//  VideoInterfaces.swift
//  EfPlayer
//
//  Created by user on 25.08.2021.
//

import Foundation

protocol VideoViewModelInputProtocol: class {
    
}

protocol VideoViewModelOutputProtocol: class {
    var delegate: VideoDelegate? { get set }
}

protocol VideoViewModelProtocol: VideoViewModelInputProtocol, VideoViewModelOutputProtocol {}

protocol VideoRouterProtocol: class {}

protocol VideoViewControllerProtocol: class {}

protocol VideoDelegate: class {
    func fetchVideo()
}
