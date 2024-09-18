import Foundation
import UIKit

// MARK: - SingleLinkNavigatorMock

public final class SingleLinkNavigatorMock {

  // MARK: Lifecycle

  public init(value: Value = .init(), event: Event = .init()) {
    self.value = value
    self.event = event
  }

  // MARK: Public

  public var value: Value
  public var event: Event

  public func resetEvent() {
    event = .init()
  }

  public func resetValue() {
    value = .init()
  }

  public func resetAll() {
    resetEvent()
    resetValue()
  }

}

extension SingleLinkNavigatorMock {

  public struct Value: Equatable, Sendable {
    public var currentPaths: [String] = []
    public var currentRootPaths: [String] = []
    public var rangePaths: [String] = []

    public init() { }
  }

  public struct Event: Equatable, Sendable {

    // MARK: Lifecycle

    public init() { }

    // MARK: Public

    public var getCurrentPaths: Int = .zero
    public var getCurrentRootPaths: Int = .zero
    public var next: Int = .zero
    public var rootNext: Int = .zero
    public var sheet: Int = .zero
    public var fullSheet: Int = .zero
    public var customSheet: Int = .zero
    public var replace: Int = .zero
    public var backOrNext: Int = .zero
    public var rootBackOrNext: Int = .zero
    public var back: Int = .zero
    public var remove: Int = .zero
    public var rootRemove: Int = .zero
    public var backToLast: Int = .zero
    public var close: Int = .zero
    public var range: Int = .zero
    public var rootReloadLast: Int = .zero
    public var alert: Int = .zero
    public var send: Int = .zero
    public var mainSend: Int = .zero
    public var allSend: Int = .zero
    public var rootBackToLast: Int = .zero
    public var rootSend: Int = .zero
    public var allRootSend: Int = .zero

  }
}

// MARK: LinkNavigatorFindLocationUsable

extension SingleLinkNavigatorMock: LinkNavigatorFindLocationUsable {
  public func getCurrentPaths() -> [String] {
    event.getCurrentPaths += 1
    return value.currentPaths
  }

  public func getCurrentRootPaths() -> [String] {
    event.getCurrentRootPaths += 1
    return value.currentRootPaths
  }
}

// MARK: LinkNavigatorProtocol

extension SingleLinkNavigatorMock: LinkNavigatorProtocol {
  public func rootBackToLast(path _: String, isAnimated _: Bool) {
    event.rootBackToLast += 1
  }

  public func rootSend(item _: LinkItem) {
    event.rootSend += 1
  }

  public func allRootSend(item _: LinkItem) {
    event.allRootSend += 1
  }

  public func next(linkItem _: LinkItem, isAnimated _: Bool) {
    event.next += 1
  }

  public func rootNext(linkItem _: LinkItem, isAnimated _: Bool) {
    event.rootNext += 1
  }

  public func sheet(linkItem _: LinkItem, isAnimated _: Bool) {
    event.sheet += 1
  }
  
  @available(iOS 15.0, *)
  public func detentSheet(linkItem: LinkItem, isAnimated: Bool, configuration: DetentConfiguration) {
    event.sheet += 1
  }

  public func fullSheet(linkItem _: LinkItem, isAnimated _: Bool, prefersLargeTitles _: Bool?) {
    event.fullSheet += 1
  }

  public func customSheet(
    linkItem _: LinkItem,
    isAnimated _: Bool,
    iPhonePresentationStyle _: UIModalPresentationStyle,
    iPadPresentationStyle _: UIModalPresentationStyle,
    prefersLargeTitles _: Bool?)
  {
    event.customSheet += 1
  }

  public func replace(linkItem _: LinkItem, isAnimated _: Bool) {
    event.replace += 1
  }

  public func backOrNext(linkItem _: LinkItem, isAnimated _: Bool) {
    event.backOrNext += 1
  }

  public func rootBackOrNext(linkItem _: LinkItem, isAnimated _: Bool) {
    event.rootBackOrNext += 1
  }

  public func back(isAnimated _: Bool) {
    event.back += 1
  }

  public func remove(pathList _: [String]) {
    event.remove += 1
  }

  public func rootRemove(pathList _: [String]) {
    event.rootRemove += 1
  }

  public func backToLast(path _: String, isAnimated _: Bool) {
    event.backToLast += 1
  }

  public func close(isAnimated _: Bool, completeAction _: @escaping () -> Void) {
    event.close += 1
  }

  public func range(path _: String) -> [String] {
    event.range += 1
    return value.rangePaths
  }

  public func rootReloadLast(items _: LinkItem, isAnimated _: Bool) {
    event.rootReloadLast += 1
  }

  public func alert(target _: NavigationTarget, model _: Alert) {
    event.rootReloadLast += 1
  }

  public func send(item _: LinkItem) {
    event.send += 1
  }

  public func mainSend(item _: LinkItem) {
    event.mainSend += 1
  }

  public func allSend(item _: LinkItem) {
    event.allSend += 1
  }

}
