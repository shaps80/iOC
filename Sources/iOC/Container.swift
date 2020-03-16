/// A iOC container that manages dependency registration and resolution
public final class Container {

    // A cache of all registrations this container owns
    private var registrations: [ObjectIdentifier: Any] = [:]

    /// A shared instance that can used to access our dependencies
    public static let shared = Container()

    // We need to make it `internal` for testing
    internal init() { }

    /// Registers the specified type with this container
    /// - Parameter resolver: A closure that behaves as a factory method for instantiating your object
    @discardableResult
    public func register<T>(_ resolver: @escaping Registration<T>.InstanceResolver) -> Registration<T> {
        let key = ObjectIdentifier(T.self) // this could be replaced by a unique identifier to allow for multiple registrations of the same type
        precondition(registrations[key] == nil, "\(T.self) already registered")

        let registration = Registration(resolver: resolver)
        registrations[key] = registration
        return registration
    }

    /// Resolves the an object of the specified type. The object type must be registered _before_ calling this method.
    /// - Parameter type: The type of the object to resolve
    public func resolve<T>(for type: T.Type = T.self) -> T {
        guard let registration = registrations[ObjectIdentifier(type)] as? Registration<T> else {
            fatalError("\(T.self) not registered")
        }

        return registration.resolve(container: self)
    }

}
