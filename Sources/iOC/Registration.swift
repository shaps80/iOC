/// A type to wrap up a registration for a type to be later instantiated via a `Container`
public final class Registration<T> {

    public typealias InstanceResolver = (Container) -> T
    public typealias CyclicResolver = (Container, T) -> Void

    internal let instanceResolver: InstanceResolver
    private var cyclicResolver: CyclicResolver?

    /// Makes a new registration
    /// - Parameters:
    ///   - resolver: A closure that behaves as a factory method for instantiating your object
    internal init(resolver: @escaping InstanceResolver) {
        self.instanceResolver = resolver
    }

    /// Resolves the object for this registration in the specified container
    /// - Parameter container: The container
    internal func resolve(container: Container) -> T {
        let instance = instanceResolver(container)
        cyclicResolver?(container, instance)
        return instance
    }

    /// Description
    ///
    /// - Parameter resolver: The closure to use to configure cyclic dependencies. The closure will be called with an instance of the container and the object.
    public func resolveCyclicDependencies(_ resolver: @escaping CyclicResolver) {
        cyclicResolver = { resolver($0, $1) }
    }

}
