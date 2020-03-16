# iOC

A simple iOC container written in Swift.

## General Idea

The basic design of an iOC is to allow registration and resolution of types.

## Considerations

- API design
    - Registration
    - Resolution
    - Dependency resolution (for cyclic deps)
- Circular dependency resolution
    - If we use a closure based registration, we can support manual resolution 
- Lifecycle
    - Given the timeframe, I'll limit support to transient (unique instance) types only
- Mutations
    - To keep things simple I won't implement any locking mechanisms.
    - In a more complete example it would be important to consider the thread safety
