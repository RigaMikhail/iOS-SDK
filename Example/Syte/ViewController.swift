//
//  ViewController.swift
//  Syte
//
//  Created by arturtarasenko on 08/20/2021.
//  Copyright (c) 2021 arturtarasenko. All rights reserved.
//

import UIKit
import Syte

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    public enum SyteScreens: Int, CaseIterable {
        
        case configuration = 0, url, wild, similars, shopTheLook, personalizations, events, autocomplete, popupar, textSearch
        
        func title() -> String {
            switch self {
            case .configuration:
                return "CONFIGURATION"
            case .url:
                return "URL SEARCH"
            case .wild:
                return "WILD SEARCH"
            case .similars:
                return "GET SIMILARS"
            case .shopTheLook:
                return "SHOP THE LOOK"
            case .personalizations:
                return "PERSONALIZATION"
            case .events:
                return "FIRE EVENTS"
            case .autocomplete:
                return "AUTOCOMPLETE"
            case .popupar:
                return "POPULAR SEARCHES"
            case .textSearch:
                return "TEXT SEARCH"
            }
        }
        
    }
    
    private var syte: Syte?
    private var resporseString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuteTableView()
        initSyte()
    }
    
    private func configuteTableView() {
        tableView.tableFooterView = UIView()
        tableView.registerNib(with: SyteExampleTableViewCell.self)
    }
    
    private func initSyte() {
        let configuration = SyteConfiguration(accountId: "9165", signature: "601c206d0a7f780efb9360f3")
        Syte.initialize(configuration: configuration) { [weak self] result in
            guard let strongSelf = self else { return }
            guard let data = result.data else { return }
            strongSelf.syte = data
            strongSelf.tableView.reloadData()
        }
    }
    // swiftlint:disable cyclomatic_complexity
    private func switchToScreen(type: SyteScreens) {
        guard let syte = syte else { return }
        switch type {
        case .configuration:
            let vc = MainStoryboard.configurationViewController
            navigationController?.pushViewController(vc, animated: true)
        case .url:
            let vc = MainStoryboard.urlSearchViewController
            vc.setSyte(syte)
            navigationController?.pushViewController(vc, animated: true)
        case .wild:
            let vc = MainStoryboard.wildSearchViewController
            vc.setSyte(syte)
            navigationController?.pushViewController(vc, animated: true)
        case .similars:
            break
        case .shopTheLook:
            break
        case .personalizations:
            break
        case .events:
            break
        case .autocomplete:
            break
        case .popupar:
            break
        case .textSearch:
            break
        }
    }
    // swiftlint:enableb cyclomatic_complexity
    
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SyteScreens.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SyteExampleTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        let exapmleValue = SyteScreens(rawValue: indexPath.row) ?? .configuration
        cell.setButtonTitle(title: exapmleValue.title())
        return cell
    }
    
}

// MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let exapmleValue = SyteScreens(rawValue: indexPath.row) else { return }
        switchToScreen(type: exapmleValue)
    }
    
}
