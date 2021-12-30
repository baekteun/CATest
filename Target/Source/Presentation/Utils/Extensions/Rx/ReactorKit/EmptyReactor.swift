//
//  EmptyReactor.swift
//  CATest
//
//  Created by 최형우 on 2021/12/30.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class EmptyReactor: Reactor, Stepper{
    var steps: PublishRelay<Step> = .init()
    private let disposeBag = DisposeBag()
    typealias Action = NoAction
    enum Mutation {}
    struct State {}
    var initialState: State = State()
}
