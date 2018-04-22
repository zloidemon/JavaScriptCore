/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

public protocol JSEngine {
    associatedtype JSRuntime: JavaScript.JSRuntime
    static func createRuntime() throws -> JSRuntime
}

public protocol JSRuntime {
    associatedtype JSContext: JavaScript.JSContext
    func createContext() -> JSContext
}

public protocol JSContext {
    associatedtype JSValue: JavaScript.JSValue
    func evaluate(_ script: String) throws -> JSValue

//    func createValue(string: String) -> JSValue
//    func createValue(number: Int) -> JSValue
//    func createValue(number: Double) -> JSValue

//    func createFunction()
}

public protocol JSValue {
    func toString() throws -> String

    var isNull: Bool { get }
    var isUndefined: Bool { get }
    var isBool: Bool { get }
    var isNumber: Bool { get }
    var isString: Bool { get }
    var isObject: Bool { get }
}

public enum Value {
    case undefined
    case null
    case bool(Bool)
    case number(Double)
    case string(String)
}
